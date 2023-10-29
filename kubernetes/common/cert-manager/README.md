## Cert-Manager

Install: 
```kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.1/cert-manager.yaml```

## Harbor

Harbor is installed with the official Helm-Chart.
Add the repository with:  
`helm repo add harbor https://helm.goharbor.io`

### Installation

#### 1. SSL/TLS
You need to create a valid certificate with cert-manager. The configuration of this certificate will be done with the `certificat.yml` file.
Make sure to set the corresponding `secretName` in the `values.yaml`

#### 2. Helm install
```helm install harbor harbor/harbor -n harbor --values ./values.yaml```

### Official Documentation
https://goharbor.io