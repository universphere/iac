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
├── ansible: Ansible Roles and Playbooks
└── kubernetes: Kubernetes Mainifests and Helm-Charts
```