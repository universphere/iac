## GitLab Runner

### Installation

Add Helm repository
```bash
helm repo add gitlab https://charts.gitlab.io
```

Configure values YAML ([click here](https://gitlab.com/gitlab-org/charts/gitlab-runner/blob/main/values.yaml))
- Set GitLab URL (git.universphere.cloud)
- Set runner registration token (method will be deprecated with git 17)
- Set rbac create: True and decomment rules
- Add volumeMounts and volumes settings (as specified in values.yaml)
- Set replicas to wished amount (at the moment = 5)

Install the runners
```bash
helm install --namespace gitlab-runner –-create-namespace gitlab-runner -f values.yaml gitlab/gitlab-runner
```

To check whether pod has started successfully
- kubectl get pods --namespace gitlab-runner

## Useful Links
- [Default values.yaml](https://gitlab.com/gitlab-org/charts/gitlab-runner/blob/main/values.yaml)
- [GitLab Runner Helm Chart Doku](https://docs.gitlab.com/runner/install/kubernetes.html#configuring-gitlab-runner-using-the-helm-chart)

