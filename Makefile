.PHONY: ansible-run

ansible-run:
	ansible-galaxy install -r ansible/requirements.yaml
	ansible-playbook -i ansible/inventory/inventory.yaml ansible/desktop.yaml -vvvvv
