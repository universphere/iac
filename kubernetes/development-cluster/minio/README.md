

Configure MinIO Helm repo
--------------------

```bash
helm repo add minio https://operator.min.io/
```

Installing the Chart
--------------------

Install this chart using:

```helm install minio-operator minio/operator --create-namespace minio-operator -n minio-operator --values ./values-<prod/staging>.yml```
## Ressources
https://min.io/docs/minio/kubernetes/upstream/operations/install-deploy-manage/deploy-operator-helm.html

https://github.com/minio/operator/blob/master/docs/env-variables.md
https://github.com/minio/operator/blob/master/helm/operator/values.yaml


## Note
Since MinIO is not capable of exposing itself on a subpath e.g. dev.us.c/minio it is necessary to apply the custom ingress manifest with a traeffik middle ware that strips the path. 