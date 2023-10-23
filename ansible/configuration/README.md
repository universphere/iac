# Configuration of the servers

These ansible roles are used for configuring and installing the necessary tools.

## VMs (universphere)

*Prerequisites:*
You need to be connected to the VPN

Execute: ```ansible-playbook vm.yml -i inventory.ini```

## Hetzner

Execute: ```ansible-playbook vm.yml -i inventory.ini```

## Update SSH Keys
*Prerequisites:*
You need to be connected to the VPN, to add and remove keys from the universphere VMs.

Execute: ```ansible-playbook update-ssh-keys.yml -i inventory.ini```

## Vagrant

*Prerequisites:*
Vagrant needs to be installed

Execute: ```vagrant up``` if the VM is not running and use ```vagrant provision``` to execute the ansible role again against the running VM.