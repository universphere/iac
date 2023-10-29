## Kubernetes

All Helm-Charts and Kubernetes-Manifests are versioned here.

### Directory structure

```
.
├── common: Charts and manifests for all clusters
├── development-cluster: Charts and manifests for the development clusters
├── production-cluster: Charts and manifests for the production clusters
```

*Why this separation?*  
Because the development and prod-cluster operate on different technical specs and on different urls.