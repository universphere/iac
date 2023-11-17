
## MinIO
Installation with the official Helm-Chart. <br>
URL: [`dev.universphere.cloud/minio`](https://dev.universphere.cloud/minio)

Add the repository with:

```bash
helm repo add minio https://operator.min.io/
```

### Installation

#### 1. Storage
```
chmod +x ./storage/apply.sh

./storage/apply.sh
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

### Ressources
https://min.io/docs/minio/kubernetes/upstream/operations/install-deploy-manage/deploy-operator-helm.html

https://github.com/minio/operator/blob/master/docs/env-variables.md

https://github.com/minio/operator/blob/master/helm/operator/values.yaml


## Notes
Since MinIO is not capable of exposing itself on a subpath e.g. dev.us.c/minio it is necessary to apply the custom ingress manifest with a traeffik middle ware that strips the path. 