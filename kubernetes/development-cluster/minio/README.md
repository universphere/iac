
## MinIO
Installation with the official Helm-Chart. <br>
URL: [`dev.universphere.cloud/minio`](https://dev.universphere.cloud/minio)

Add the repository with:

```bash
helm repo add minio https://operator.min.io/
```

### Installation

#### 1. Storage
With shell script:
```
chmod +x ./storage/apply.sh

./storage/apply.sh
```

or manually:

```bash
kubectl apply -f ./storage/storageclass.yml
kubectl apply -f ./storage/volume.yml
kubectl apply -f ./storage/pvc.yml 
```

#### 2. MinIO Operator + MinIO Console
First apply the treafik middlware for work around (see section Notes)

```bash
kubectl apply -f ./operator/middleware.yml
```
Now install the actual Helm chart.

``` bash
helm install minio-operator minio/operator --create-namespace minio-operator -n minio-operator --values ./operator/values-prod.yml
```
For receiving the login jwt, follow the instructions printed after installing the chart.

#### 3. MinIO Tenant
First the middleware for the same workaround:
```bash
kubectl apply -f ./tenant/middleware.yml
```
Now the Helm chart:
```bash
helm install --namespace minio-tenant --create-namespace minio-tenant minio/tenant --values ./tenant/values-prod.yaml
```
### Notes
Since MinIO is not capable of exposing itself on a subpath e.g. dev.us.c/minio it is necessary to apply the custom ingress manifest with a traeffik middle ware that strips the path. <br>

<b>Further work</b>: 
* Dynamic Provisioning (local-path-provisioner may help)
* -> eventually distributed mode 

### Ressources
https://min.io/docs/minio/kubernetes/upstream/operations/install-deploy-manage/deploy-operator-helm.html

https://github.com/minio/operator/blob/master/docs/env-variables.md

https://github.com/minio/operator/blob/master/helm/operator/values.yaml

https://github.com/minio/operator/blob/master/helm/tenant/values.yaml

https://github.com/minio/minio/tree/master/docs/config

https://github.com/minio/directpv
https://github.com/rancher/local-path-provisioner
