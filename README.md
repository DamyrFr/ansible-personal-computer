# PC as Code

All my configuration files and Debian config by code !

Ansible version > `ansible 2.9.X`

Build for deploy my environment on laptop, PC and GNU/Linux bastion.

Warning : This code is build for Debian.

For versioning I follow this tag schema : {DEBIAN_MAJOR}.{MY_UPDATE}

This is build to make new installation of my environment easier. All dosen't follow best practice for now.

## Inputs

* User related `vars/user.yml`

|   Variables      |   Types      | Description |
| -------------    |:------------:| -----------:|
|     user         |    string    | User name for my user |
|    tmp_dir		   |    string    | Temporary directory |

* System related `vars/system.yml`

|   Variables      |   Types      | Description |
| -------------    |:------------:| -----------:|
|     gui          |    bool      | Used to set if you need to configure GNOME 3 environment |
|   forward        |    bool      | Used to set if you need to allow the FORWARD iptables tables |
|custom_hostname   |    string    | Custom hostname for the computer|
|    timezone      |    string    | Current timezone for user |
| architecture     |    string    | Your computer infrastrucutre |
| dns_servers      | list(string) | List of DNS servers to set |
|    alt_env       | list(string) | List of alternative user |

* packages `vars/packages.yml`

## Tags

* `firefox` : Insall / upgrade Firefox (latest release)
* `upgrade` : Install / upgrade packages, software
* `dotfiles` : Sync dotfiles

## Roles

* User : create user, create ssh key and add it to sudoers
* Packages : Install softwares, apt, pip, gem and Vagrant
* Dotfiles : Deploy my dotfiles, .zshrc, .gitconfig, .tmux.conf
* Security : Setup iptables rules make it permanent
* gnome : if your set "gui" configure Gnome 3
* firefox : install latest firefox version, you can deploy only this using `firefox-only`

## How configure your own user ?

Create your own variable user files ! Or fork it for more possibilities ;)

## If you juste need my dotfiles

Checkout `./roles/dotfiles/files/`

## Credit for wallpaper

[Emilien Muller](https://unsplash.com/@mil68)
