init:
	pip3 install -r requirements.txt
	ansible-galaxy install -r requirements.yml

dry-run-full:
	ansible-playbook computer.yml --check --tags all

debug:
	ansible-playbook -vvv computer.yml --tags all

full:
	ansible-playbook computer.yml --tags all

firefox:
	ansible-playbook computer.yml --tags firefox

upgrade:
	ansible-playbook computer.yml --tags "firefox,upgrade"

dotfiles:
	ansible-playbook computer.yml --tags dotfiles
