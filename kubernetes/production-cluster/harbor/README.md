## Harbor

Harbor is installed with the official Helm-Chart.
Add the repository with:  
`helm repo add harbor https://helm.goharbor.io`

### Installation

#### 1. SSL/TLS
You need to create a valid certificate with cert-manager. The configuration of this certificate will be done with the `../certifictate/certificate.yml` file.
Make sure to set the corresponding `secretName` in the `values.yaml`

#### 2. Persistent Volume
```bash
kubectl apply -f pv.yml
```

#### 3. Helm install
```bash
helm install harbor harbor/harbor -n harbor --values ./values-<prod/staging>.yaml
```

### Official Documentation
https://goharbor.io