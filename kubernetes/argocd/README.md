## Argo

### Installation
```bash
helm repo add argo https://argoproj.github.io/argo-helm
```

```bash
helm install argocd argo/argo-cd -n argocd --create-namespace -f values.yml
```

### Configuration of OIDC:

1. First you'll need to encode the client secret in base64: `echo -n '83083958-8ec6-47b0-a411-a8c55381fbd2' | base64`

2. Then you can edit the secret and add the base64 value to a new key called oidc.keycloak.clientSecret using `kubectl edit secret argocd-secret`

Your Secret should look something like this:
```yml
apiVersion: v1
kind: Secret
metadata:
  name: argocd-secret
data:
  ...
  oidc.keycloak.clientSecret: ODMwODM5NTgtOGVjNi00N2IwLWE0MTEtYThjNTUzODFmYmQy   
  ...
```

Docs: https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/keycloak/

Note:  
If there is an Error `cipher: message authentication failed`, reload the `argocd-server` Deployment with `kubectl rollout restart -n argocd deployment/argocd-server`

### Official Documentation
https://argo-cd.readthedocs.io/en/stable/