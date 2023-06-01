#### Start Ansible docker ####

ansible:
	export ANSIBLE_NAME=ansible-5gc; \
	sh ./scripts/ansible ssh-agent bash

### a. Private keys (for ssh and git)

list-keys:
	ssh-add -l

# add-keys:
# 	ssh-add <your key>

### b. Deugging

pingall:
	ansible-playbook -i hosts.ini pingall.yml

### c. Provision rke2
rke2-install:
	ansible-playbook -i hosts.ini rke2.yml --tags install 
rke2-uninstall:
	ansible-playbook -i hosts.ini rke2.yml --tags uninstall 

### d. Provision helm
helm-install:
	ansible-playbook -i hosts.ini helm.yml --tags install 
helm-uninstall:
	ansible-playbook -i hosts.ini helm.yml --tags uninstall 