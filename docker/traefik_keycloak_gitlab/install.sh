# Install docker engine with docker compose
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Create directory structure
mkdir -p /Docker/treafik/letsencrypt
mkdir -p /Docker/gitlab/config
mkdir -p /Docker/gitlab/data
mkdir -p /Docker/gitlab/logs
mkdir -p /Docker/keycloak/pg_data
sudo chown -R k8s:k8s /Docker
sudo chmod -R 700 /Docker

# Docker compose file
cd /Docker
echo '
version: "3"
services:
  traefik:
    image: "traefik:v2.10"
    container_name: "traefik"
    restart: always
    command:
      - "--providers.docker=true"
      # Allow both entrypoints 80 and 443 but always redirect to 443
      - "--entrypoints.web.address=:80"
      - "--entrypoints.web.http.redirections.entrypoint.to=websecure"
      - "--entrypoints.web.http.redirections.entrypoint.scheme=https"
      - "--entrypoints.websecure.address=:443"
      # Letsencrypt; TODO: Set correct E-Mail later
      - "--certificatesresolvers.myresolver.acme.email=erik99.rain@gmail.com"
      - "--certificatesresolvers.myresolver.acme.storage=/letsencrypt/acme.json"
    ports:
      - "443:443"
      - "8080:8080"
    volumes:
      - "/Docker/traefik/letsencrypt:/letsencrypt"
      - "/var/run/docker.sock:/var/run/docker.sock"

  gitlab:
    image: "gitlab/gitlab-ce:latest"
    container_name: "gitlab"
    restart: always
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.gitlab.rule=Host(`git.universphere.cloud`)"
      - "traefik.http.routers.gitlab.entrypoints=websecure"
      - "traefik.http.routers.gitlab.tls.certresolver=myresolver"
    env_file:
      - ./.env
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'https://git.universphere.cloud'
        # GitLab with external proxy requires to disable auto redirect
        # https://medium.com/@gustitammam/how-to-install-self-managed-gitlab-with-nginx-reverse-proxy-and-lets-encrypt-ssl-in-ubuntu-20-04-4f7a1e87c857
        # https://janl1.de/gitlab-ce-mit-registry-und-traefik-2-0-reverse-proxy/
        nginx['listen_port'] = 80
        nginx['listen_https'] = false

        # DB
        gitlab_rails['db_adapter'] = "postgresql"
        gitlab_rails['db_database'] = "gitlab"
        gitlab_rails['db_username'] = "postgres"
        gitlab_rails['db_password'] = "${DATABASE_PASSWORD}"
        gitlab_rails['db_host'] = "gitlab_database"

        # Disable username password login
        # According to https://stackoverflow.com/questions/26618030/gitlab-disable-regular-username-password-login-and-only-allow-omniauth-login this will not work
        # In newer GitLab versions this is only possible using the admin ui in GitLab iteself
        gitlab_rails['gitlab_signin_enabled'] = false

        # OIDC
        gitlab_rails['omniauth_providers'] = [
                 {
                   name: "openid_connect",
                   label: "Keycloak",
                   args: {
                     name: "openid_connect",
                     scope: ["openid", "profile", "email"],
                     response_type: "code",
                     issuer: "https://keycloak.universphere.cloud",
                     client_auth_method: "query",
                     discovery: true,
                     uid_field: "preferred_username",
                     pkce: true,
                     client_options: {
                       identifier: "<YOUR PROJECT CLIENT ID>",
                       secret: "<YOUR PROJECT CLIENT SECRET>",
                       redirect_uri: "https://git.universphere.cloud/users/auth/openid_connect/callback",
                     }
                   }
                 }
              ]
    volumes:
      - /Docker/gitlab/config:/etc/gitlab
      - /Docker/gitlab/logs:/var/log/gitlab
      - /Docker/gitlab/data:/var/opt/gitlab
' > docker-compose.yaml
