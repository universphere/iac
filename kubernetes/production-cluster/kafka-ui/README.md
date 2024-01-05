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

Example for RBAC configuration
```yaml
    rbac:
      roles:
        - name: "admin"
          clusters:
            - universphere-kafka
          subjects:
            - provider: oauth
              type: role
              value: "Universphere"
          permissions:
            - resource: applicationconfig
              actions: all
            - resource: clusterconfig
              actions: all
            - resource: topic
              value: ".*"
              actions: all
            - resource: consumer
              value: ".*"
              actions: all
            - resource: schema
              value: ".*"
              actions: all
            - resource: connect
              value: ".*"
              actions: all
            - resource: ksql
              value: ".*"
              actions: all
            - resource: acl
              value: ".*"
              actions: [ "view" ]
        - name: "readonly"
          clusters:
            - universphere-kafka
          subjects:
            - provider: oauth
              type: role
              value: "StaardUp"
          permissions:
            - resource: clusterconfig
              actions: [ "view" ]
            - resource: topic
              value: "universphere.*"
              actions: [ "view" ]
            - resource: consumer
              value: ".*"
              actions: [ view ]
            - resource: schema
              value: ".*"
              actions: [ view ]
            - resource: connect
              value: ".*"
              actions: [ view ]
```