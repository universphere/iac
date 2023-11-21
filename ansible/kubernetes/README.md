# Automation of directory creation for k8s 
Currently used for local pv since the paths won't get created by kubectl/ the manifests.

## How to run: 
ansible-playbook kubernetes/vagrant.yml -i inventory.ini --user k8s