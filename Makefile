dry_run:
	ansible-playbook computer.yml --check

deploy:
	ansible-playbook computer.yml
