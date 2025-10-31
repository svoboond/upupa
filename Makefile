.PHONY: all host2vault install update upgrade symlinks vault2host

all:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv

host2vault:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tags host2vault --extra-vars "vault_path=${VAULT_PATH}"

install:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tags install

update:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tags update

upgrade:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tags install --tags update

symlinks:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tags symlinks

vault2host:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tags vault2host --extra-vars "vault_path=${VAULT_PATH}"
