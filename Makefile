init:
	apt update && apt install python3 python3-pip3
	pip3 install -r requirements.txt
	ansible-galaxy install -r requirements.yml

pass:
	curl -sSL https://codeberg.org/PassFF/passff-host/releases/download/latest/install_host_app.sh | bash -s -- firefox

dry-run-full:
	ansible-playbook computer.yml --check --tags all

debug:
	ansible-playbook -vvv computer.yml --tags all

full:
	ansible-playbook computer.yml --tags all

firefox:
	ansible-playbook computer.yml --tags firefox

upgrade:
	ansible-playbook computer.yml --tags "firefox,upgrade,neovim"

neovim:
	ansible-playbook computer.yml --tags "neovim"

asdf:
	ansible-playbook computer.yml --tags "asdf"

dotfiles:
	ansible-playbook computer.yml --tags dotfiles
