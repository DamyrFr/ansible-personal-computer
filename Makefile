init:
	apt update
	apt -y upgrade
	apt -y install python3-pip
	pip3 install ansible
	ansible-galaxy collection install ansible.posix

dry_run:
	ansible-playbook computer.yml --check

debug:
	ansible-playbook -vvv computer.yml

full:
	ansible-playbook computer.yml

firefox-only:
	ansible-playbook firefox-upgrade.yml
