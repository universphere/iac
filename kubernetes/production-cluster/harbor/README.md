## Harbor

Harbor is installed with the official Helm-Chart.
Add the repository with:  
`helm repo add harbor https://helm.goharbor.io`

### Installation

#### 1. SSL/TLS
You need to create a valid certificate with cert-manager. The configuration of this certificate will be done with the `../certifictate/certificate.yml` file.
Make sure to set the corresponding `secretName` in the `values.yaml`

#### 2. Persistent Volume
Make sure all paths are available on the machine and run the corresponding ansible script
path: `ansible/kubernetes/directory_structure_harbor`

then

```bash
kubectl apply -f pv.yml
```

#### 3. Helm install
```bash
helm install harbor harbor/harbor -n harbor --values ./values-<prod/staging>.yaml
```

### Official Documentation
https://goharbor.io


### How-to-Harbor
#### Push 
1. Go to `harbor.universphere.cloud`
2. Login with keycloak
    * username: test.user
    * password: test.user
3. Create new project
4. Click on profile (the user name upper right corner)
5. Copy the token 
6. Create a docker container with a tag 
`docker tag SOURCE_IMAGE[:TAG] harbor.universphere.cloud/[:projectname]/REPOSITORY[:TAG]`
7. Push container to registry
`docker push harbor.universphere.cloud/[:projectname]/REPOSITORY[:TAG]`
 * When asking for username and password:
 * username: test.user
 * password: click on profile (username upper right corner in harbor and copy the token) paste the token in 

 #### Pulling
1. Go to projects 
2. Select the corresponding  project name
3. Select image
4. Select image again 
5. Click on Copy Pull Command
6. Copy Command
7. Use the command in the cli