# PC as Code

All my configuration files and Debian config by code !

Ansible version : `ansible 2.9.6`

Build for deploy my environment on laptop, PC and GNU/Linux bastion.

Warning : This code is build for Debian 9+ and Ubuntu.

## Inputs 

|   Variables   |   Types      | Description |
| ------------- |:------------:| -----------:|
|     user      |    string    | User name for my user |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

  vars:
    user: damyr
    gui: true 
    forward: true
    custom_hostname: laptop
    timezone: 'Europe/Paris'
    tmp_dir: "/tmp"
    vagrant_version: "2.2.7"
    architecture: "x86_64"

  roles:
    - user
    - packages
    - dotfiles
    - security
    - include_role:
      name: gnome
      when: gui == true
