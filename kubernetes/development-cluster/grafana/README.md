## Grafana Loki Promtail
One Grafana to rule them all - loki is not deployed with a dedicated grafana instance.
Add the repository with:
```bash
helm repo add grafana https://grafana.github.io/helm-charts
```
### Installation
#### 1. SSL/TLS
In `../certificate/certificate-<prod/staging>.yml` append `grafana.universphere.cloud` in the `dnsName` block.

#### 2. Persistent Volume
Make sure all paths are available on the machine and run the corresponding ansible script (see ansible README in the following path):
```bash
iac/ansible/kubernetes/
```

then

```bash
kubectl apply -f pv.yml
```
#### 3. Install Grafana

```bash
helm install grafana grafana/grafana --values values-prod.yml -n grafana
```

#### 4. Install Loki
```bash
helm install loki grafana/loki --values ./loki/values-prod.yml -n grafana
```
#### 5. Install Promtail
```bash
helm install promtail grafana/promtail --values ./promtail/values-prod.yml -n grafana
```

### TODOs
* add ansible path to existing role, currently not commited/ pushed
* test loki integration -> some stuff with the admin password wrong
* add loki datasource in helm
* after keycloak login user is per default just a viewer -> need to be at least a developer or something like that 
* --> login as dev or admin (both must be working)
* test logging with a hello world
* deploy on prod cluster (remember to change the default credentials)
* update ansible role for keycloak with grafana as client (currently wildcard for test purposes)

### Ressources
https://github.com/grafana/helm-charts/blob/main/charts/grafana/values.yaml

https://github.com/grafana/loki/blob/main/production/helm/loki/values.yaml

https://github.com/grafana/helm-charts/blob/main/charts/promtail/values.yaml

https://github.com/grafana/helm-charts/blob/main/charts/grafana/README.md