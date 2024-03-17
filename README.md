# vm-configs

## About

This is just some personal configs for my Debian setup for Virtual box. Feel free to use. 



## Usage

### Setup

#### ENV vars

```sh
SUDO_PASS - Sudo password of the VM user. If using the default install it shoul be changeme.
GIT_EMAIL - This is used to set your github email.
GIT_NAME - This is used to set your github name.
GIT_BRANCH - The branch on this repo. Typically main but dev for testing out new features.
```


#### 1. Get repo

```sh
rm -rf /tmp/vm-configs && mkdir -p /tmp/vm-configs && cd /tmp/vm-configs && git clone https://github.com/hubertwwong/vm-configs.git
```

#### 2a. min - stable

```sh
SUDO_PASS='changeme' GIT_EMAIL='foo@bar.com' GIT_NAME='Hubert Wong' GIT_BRANCH='main' ./scripts/deb-install-min.sh
```
#### 2b. min -dev

```sh
SUDO_PASS='changeme' GIT_EMAIL='foo@bar.com' GIT_NAME='Hubert Wong' GIT_BRANCH='dev' ./scripts/deb-install-min.sh
```

## Notes

### General

If you use the default install in Virtual box, there should be a default user that you can use.

Default credential

```
vboxuser
changeme
```

## Scratch

```sh
export SUDO_PASS=changeme && export GIT_EMAIL="foo@bar.com" && export GIT_NAME="Hubert Wong" && rm -rf ~/zzz/xubuntuDesktopConfig && mkdir -p ~/zzz/xubuntuDesktopConfig && cd ~/zzz/xubuntuDesktopConfig && echo $SUDO_PASS | sudo -S apt update && echo $SUDO_PASS | sudo -S apt -y upgrade && echo $SUDO_PASS | sudo -S apt -y autoclean && echo $SUDO_PASS | sudo -S apt -y autoremove && echo $SUDO_PASS | sudo -S apt -y install ansible git && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git . && ansible-playbook -v --extra-vars "ansible_become_pass=$SUDO_PASS" prod/initialSetup/site-deb.yaml
```