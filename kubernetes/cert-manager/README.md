## Cert-Manager

```bash
helm repo add jetstack https://charts.jetstack.io
```

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.2/cert-manager.crds.yaml
```

```bash
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.13.2 \
  -f values.yml
```

```bash
kubectl apply -f cluster-issuer-staging.yml
```
