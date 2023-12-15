## Kafka UI

### Installation

Add repository:
```bash
helm repo add kafka-ui https://provectus.github.io/kafka-ui-charts
```

Configure and apply the config map:
```bash
kubectl apply -f config-map.yml
```

Add a secret with the oidc client secret:
```yml
apiVersion: v1
kind: Secret
metadata:
  name: kafka-ui-client-secret
stringData:
  AUTH_OAUTH2_CLIENT_KEYCLOAK_CLIENTSECRET: "<client-secret>"
```

Configure and apply the secret:
```bash
kubectl apply -f secret.yml
```

Install Kafka-UI:
```bash
helm install kafka-ui kafka-ui/kafka-ui -f values.yml
```