#### Variables ####

export K8S_ROOT_DIR ?= .

export ANSIBLE_NAME ?= ansible-k8s
export HOSTS_INI ?= hosts.ini

#### Start Ansible docker ####

ansible:
	export ANSIBLE_NAME=$(ANSIBLE_NAME); \
	sh $(K8S_ROOT_DIR)/scripts/ansible ssh-agent bash

### a. Private keys (for ssh and git)

list-keys:
	ssh-add -l

# add-keys:
# 	ssh-add <your key>

### b. Deugging

pingall:
	ansible-playbook -i $(HOSTS_INI) $(K8S_ROOT_DIR)/pingall.yml

### c. Provision k8s
k8s-install: rke2-install helm-install
k8s-uninstall: helm-uninstall rke2-uninstall

### d. Provision rke2
rke2-install:
	ansible-playbook -i $(HOSTS_INI) $(K8S_ROOT_DIR)/rke2.yml --tags install 
rke2-uninstall:
	ansible-playbook -i $(HOSTS_INI) $(K8S_ROOT_DIR)/rke2.yml --tags uninstall 

### e. Provision helm
helm-install:
	ansible-playbook -i $(HOSTS_INI) $(K8S_ROOT_DIR)/helm.yml --tags install 
helm-uninstall:
	ansible-playbook -i $(HOSTS_INI) $(K8S_ROOT_DIR)/helm.yml --tags uninstall