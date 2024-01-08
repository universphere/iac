## Landing Page

### Installation

The image of the landing page is stored at https://harbor.universphere.cloud. The repository is a private and we use a robot account on harbor to pull the image. This requires setting up a pull secret with the name and access token of the robot account. The process is documented under: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/


```bash
kubectl apply -f deployment.yml
```

```bash
kubectl apply -f service.yml
```

```bash
kubectl apply -f ingress.yml
```