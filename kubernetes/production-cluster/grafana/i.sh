kubectl apply -f pv.yml
helm install grafana grafana/grafana --values values-prod.yml -n grafana
helm install loki grafana/loki --values ./loki/values-prod.yml -n grafana