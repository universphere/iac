kubectl apply -f ./storage/storageclass.yml
kubectl apply -f ./storage/volume.yml
kubectl apply -f ./storage/pvc.yml 

echo "done!"