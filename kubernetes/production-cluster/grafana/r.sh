helm delete -n grafana grafana
kubectl delete -f pv.yml
kubectl apply -f pv.yml
helm install grafana grafana/grafana --values values-prod.yml -n grafana