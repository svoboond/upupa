.PHONY: all host2vault install upgrade symlinks vault2host

all:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv

host2vault:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tag host2vault --extra-vars "vault_path=${VAULT_PATH}"

install:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tag install

upgrade:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tag upgrade

symlinks:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tag symlinks

vault2host:
	ansible-playbook -i ansible/inventory/desktop.yaml ansible/desktop.yaml -vvvvv --tag vault2host --extra-vars "vault_path=${VAULT_PATH}"
