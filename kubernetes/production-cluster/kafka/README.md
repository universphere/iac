## Kafka

### Installation

Operator:
```bash
helm install strimzi-cluster-operator --version 0.38.0 oci://quay.io/strimzi-helm/strimzi-kafka-operator
```

Kafka Cluster:
```bash
kubectl apply -f kafka.yml
```
#### Optional
Create Topics:
```bash
kubectl apply -f topic.yml
```

Create User:
```bash
kubectl apply -f user.yml
```