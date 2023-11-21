# This Repository manages the Infrastructure-as-Code for the Universphere

## Glosar
- tgk:
    - Traefik + GitLab + Keycloak
    - Läuft auf der Servernode: i-k8s-node-2
- loadbalancer:
    - Nginx (Loadbalancer)
    - Läuft auf der Servernode: i-k8s-node-1
    - Ist über universphere.cloud erreichbar
    - Fungiert als "DNS"-Proxy

## Directory structure
```
.
├── ansible
│   ├── configuration
│   │   ├── group_vars: Set group-wide variables
│   │   ├── hetzner.yml Roles that should be applied to prod servers
│   │   ├── README.md: More to read
│   │   ├── roles
│   │   │   ├── docker: Setup docker and set user to docker group
│   │   │   ├── ssh-keys: Put public ssh key to authorized keys for all server nodes
│   │   │   ├── utils: Setup utils like vim, wget, curl, tree, git, htop, ...
│   │   │   └── zsh: Setup zsh
│   │   ├── update-ssh-keys.yml Roles that should be applied to all servers to add ssh keys
│   │   └── vm.yml Roles that should be applied to prod servers
│   ├── docker
│   │   ├── group_vars: Set group-wide variables
│   │   ├── host_vars: Set host-specific variables
│   │   ├── roles
│   │   │   ├── directory_structure_loadbalancer: Create the fodler structure for the loadbalancer vm
│   │   │   ├── directory_structure_tgk: Create the fodler structure for the tgk vm
│   │   │   ├── docker_network: Create the docker networks for the tgk vm 
│   │   │   ├── gitlab: Gitlab task that setups traefik with all needed files
│   │   │   ├── keycloak: Keycloak task that setups keycloak with all needed files
│   │   │   ├── nginx: Nginx task that setups the loadbalancer with all needed files
│   │   │   └── traefik: Traefik task that setups traefik with all needed files
│   │   ├── loadbalancer-vm.yml: Roles that should be applied to loadbalancer host
│   │   └── tkg-vm.yml_ Roles that should be applied to tgk host
│   └── inventory.ini: Contains all the host configurations
└── docker-compose: : Contains the dockerized version of the deployed services as docker-compose.yml files
```

## Playbooks and their function
TBD