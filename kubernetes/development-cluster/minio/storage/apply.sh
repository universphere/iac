kubectl apply -f minio-volume.yml -n minio-operator
kubectl apply -f minio-pvc.yml -n minio-operator

echo "done!"