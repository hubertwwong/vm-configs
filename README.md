# vm-configs

## About

This is just some personal configs for my Debian setup for Virtual box. Feel free to use. 



## Usage

### Setup

#### Main version

```sh
SUDO_PASS='changeme' GIT_EMAIL='foo@bar.com' GIT_NAME='Hubert Wong' GIT_BRANCH='main' ./scripts/deb-install-min.sh
```
#### Development

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