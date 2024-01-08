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

To get admin password:
` kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo`

#### 4. Install Loki & Promtail
```bash
helm install loki oci://registry-1.docker.io/bitnamicharts/grafana-loki -n grafana --values loki-values.yaml
```

### Ressources
https://github.com/grafana/helm-charts/blob/main/charts/grafana/values.yaml

https://github.com/grafana/loki/blob/main/production/helm/loki/values.yaml

https://github.com/grafana/helm-charts/blob/main/charts/promtail/values.yaml

https://github.com/grafana/helm-charts/blob/main/charts/grafana/README.md
