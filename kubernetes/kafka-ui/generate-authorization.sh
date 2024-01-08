kubectl get secret -n kafka kafka-cluster-ca-cert -o jsonpath='{.data.ca\.p12}' | base64 -d > kafka-cluster-ca.p12
kubectl get secret -n kafka kafka-cluster-ca-cert -o jsonpath='{.data.ca\.password}' | base64 -d

printf "\n"

kubectl get secret -n kafka kafka-demo -o jsonpath='{.data.user\.p12}' | base64 -d > kafka-user.p12
kubectl get secret -n kafka kafka-demo -o jsonpath='{.data.user\.password}' | base64 -d