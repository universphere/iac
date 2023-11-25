**Gitlab Runner documentation**  <br>
**Connect to node via SSH/ only needed for manual set-up**
>*Example for connecting to node 1 in DEV cluster* <br>
- ssh root@IP-address -i \path\to\privatekey OR ssh root@IP-address (if private key allready known to ssh-agent)
<br>

**Commands to check if prerequisites are met (Helm version >=2 installed and kubectl installed)**
>Check if Helm is installed
- Helm version
>Check if kubectl is installed
- kubectl version
<br>

**If prerequisites are met** <br>
>to check for installed helm repos
- helm repo list
>Add GitLab Helm Repo (only needed if repo not yet installed)
- helm repo add gitlab https://charts.gitlab.io
<br>

**configure values YAML ([click here](https://gitlab.com/gitlab-org/charts/gitlab-runner/blob/main/values.yaml))**
- Set GitLab URL (git.universphere.cloud)
- Set runner registration token (method will be deprecated with git 17)
- Set rbac create: True and decomment rules
- Add volumeMounts and volumes settings (as specified in values.yaml)
- Set replicas to wished amount (at the moment = 5)
<br>

**Once you have configured values.yaml**
>Make sure to install as sudo to ensure that runners have admin rights (command includes creation of namespace)
- helm install --namespace gitlab-runner –-create-namespace gitlab-runner -f values.yaml gitlab/gitlab-runner
<br>

**To check whether pod has started successfully**
- kubectl get pods --namespace gitlab-runner

>**Useful Links**
- [Default values.yaml](https://gitlab.com/gitlab-org/charts/gitlab-runner/blob/main/values.yaml)
- [GitLab Runner Helm Chart Doku](https://docs.gitlab.com/runner/install/kubernetes.html#configuring-gitlab-runner-using-the-helm-chart)
<br>
