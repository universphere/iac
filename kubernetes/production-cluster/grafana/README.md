```bash
kubectl create namespace grafana
```

```bash
helm install grafana grafana/grafana --values values-<prod/staging>.yml -n grafana
```