init:
	apt update
	apt -y upgrade
	apt -y python3-pip
	pip3 install ansible
	ansible-galaxy collection install ansible.posix

dry_run:
	ansible-playbook computer.yml --check

debug:
	ansible-playbook -vvv computer.yml

deploy:
	ansible-playbook computer.yml
