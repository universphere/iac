## Sonarqube

Sonarqube is installed with the official Helm-Chart.
Add the repository with:  
`helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube`

### Installation

#### 1. SSL/TLS
You need to create a valid certificate with cert-manager. 
The configuration of this certificate will be done with the `../certifictate/certificate.yml` file.
Make sure to set the corresponding `secretName` in the `values.yaml`.
See `../certifictate/README.md` for how to apply it.


#### 2. Persistent Volume
Make sure all paths are available on the machine and run the corresponding ansible playbook path: `ansible/worker-vm.yaml`.
Then apply the persistent volume using:

```bash
kubectl apply -f pv.yml
```

#### 3. Helm Install
```bash
helm install sonarqube sonarqube/sonarqube -n sonarqube --values ./values-sonar.yaml
```