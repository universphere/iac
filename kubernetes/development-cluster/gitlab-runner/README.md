##Gitlab Runner documentation##
##Useful Links##
- Default values.yaml: https://gitlab.com/gitlab-org/charts/gitlab-runner/blob/main/values.yaml
- GitLab Runner Helm Chart Doku: https://docs.gitlab.com/runner/install/kubernetes.html#configuring-gitlab-runner-using-the-helm-chart


-- Connect to node via SSH/ only needed for manual set-up --
-- Example for connecting to node 1 in DEV cluster --
1. ssh root@65.108.248.1 -i \path\to\privatekey OR ssh root@65.108.248.1 (if private key allready known to ssh-agent

-- Check if prerequisites are met --
-- Check if Helm is installed
2. Helm version
-- Check if kubectl is installed
3. kubectl version


-- If prerequisites are met
--to check for installed helm repos
4. helm repo list
-- Add GitLab Helm Repo (only needed if repo not yet installed)
5. helm repo add gitlab https://charts.gitlab.io

--configure values YAML (https://gitlab.com/gitlab-org/charts/gitlab-runner/blob/main/values.yaml)
6. Set GitLab URL (git.universphere.cloud)
7. Set runner registration token (method will be deprecated with git 17)
8. Set rbac create: True and decomment rules
9. Add volumeMounts and volumes settings (as specified in values.yaml)
10. Set replicas to wished amount (at the moment = 5)

--Transfer values.yaml (here via scp, not best practice)--
11. scp C:\Users\Lenovo\Downloads\values.yaml root@65.108.248.1:/root/

--Once you have configured values.yaml
-- Make sure to install as sudo to ensure that runners have admin rights (command includes creation of namespace)
12. helm install --namespace gitlab-runner –-create-namespace gitlab-runner -f values.yaml gitlab/gitlab-runner

--To check whether pod starts successfully
13. kubectl get pods --namespace gitlab-runner


