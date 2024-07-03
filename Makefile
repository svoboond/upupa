.PHONY: ansible-all ansible-host2vault ansible-install ansible-upgrade ansible-symlinks ansible-vault2host

ansible-all:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv

ansible-host2vault:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tag host2vault --extra-vars "vault_path=${VAULT_PATH}"

ansible-install:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tag install

ansible-upgrade:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tag upgrade

ansible-symlinks:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tag symlinks

ansible-vault2host:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tag vault2host --extra-vars "vault_path=${VAULT_PATH}"
