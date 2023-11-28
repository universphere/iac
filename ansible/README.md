# Configuration of the servers

These ansible roles are used for configuring and installing the necessary tools.

## VMs (universphere, prod)

*Prerequisites:*
You need to be connected to the VPN

Execute: ```ansible-playbook vm.yml -i inv-prod```

## Hetzner (dev)

Execute: ```ansible-playbook vm.yml -i inv-dev```

## Update SSH Keys
*Prerequisites:*
You need to be connected to the VPN, to add and remove keys from the universphere VMs.

Execute: ```ansible-playbook update-ssh-keys.yml -i inv-prod```
Execute: ```ansible-playbook update-ssh-keys.yml -i inv-dev```

# Automation of directory creation for k8s 
Currently used for local pv since the paths won't get created by kubectl/ the manifests.

## How to run: 
ansible-playbook kubernetes/vagrant.yml -i inventory.ini --user k8s

## Vagrant

*Prerequisites:*
Vagrant needs to be installed

Execute: ```vagrant up``` if the VM is not running and use ```vagrant provision``` to execute the ansible role again against the running VM.