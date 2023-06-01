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
