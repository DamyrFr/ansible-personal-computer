dry_run:
	ansible-playbook computer.yml --check

debug:
	ansible-playbook -vvv computer.yml

deploy:
	ansible-playbook computer.yml
