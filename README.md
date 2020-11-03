# PC as Code

All my configuration files and Debian config by code !

Ansible version > `ansible 2.9.X`

Build for deploy my environment on laptop, PC and GNU/Linux bastion.

Warning : This code is build for Debian 9+.

## Inputs (vars/user.yml) 

|   Variables   |   Types      | Description |
| ------------- |:------------:| -----------:|
|     user      |    string    | User name for my user |
|     gui       |    bool      | Used to set if you need to configure GNOME 3 environment |
|   forward     |    bool      | Used to set if you need to allow the FORWARD iptables tables |
|custom_hostname|    string    | Custom hostname for the computer|
|    timezone   |    string    | Current timezone for user |
|    tmp_dir    |    string    | Temporary directory |
|vagrant_version|    string    | Version of Vagrant to use |
| architecture  |    string    | Your computer infrastrucutre |


## Roles

* User : create user, create ssh key and add it to sudoers
* Packages : Install softwares, apt, pip, gem and Vagrant
* Dotfiles : Deploy my dotfiles, .zshrc, .gitconfig, .tmux.conf
* Security : Setup iptables rules make it permanent
* gnome : if your set "gui" configure Gnome 3

## How configure your own user ?

Create your own variable user files ! Or fork it for more possibilities ;)

## If you juste need my dotfiles

Checkout `./roles/dotfiles/files/`
