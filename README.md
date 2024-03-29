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
PLAYBOOK - Playbook to run.
```

#### 0. Set ENV variables

```sh
export SUDO_PASS='changeme' && export GIT_EMAIL='foo@bar' && export GIT_NAME='Hubert Wong' && export GIT_BRANCH='main'
```

#### 1. Get repo

```sh
echo $SUDO_PASS | sudo apt install git -y && rm -rf ~/configs/vm-configs && mkdir -p ~/configs/ && cd ~/configs/ && git clone https://github.com/hubertwwong/vm-configs.git && cd vm-configs && git checkout $GIT_BRANCH
```

#### 2a. minimal install

```sh
PLAYBOOK="site" ./scripts/deb-install.sh
```

#### 2b. dev install

```sh
PLAYBOOK="site-dev" ./scripts/deb-install.sh
```

#### 2c. syncthing install

```sh
PLAYBOOK="site-sync" ./scripts/deb-install.sh
```

#### 2d. remote desktop install

Gnome has a pretty good server.
1. Settings -> Sharing -> Remote Desktop.
2. Toggle it on.
3. Toggle remote desktop and remote control.
4. Change the password. Its randomized.

#### 3 Reboot the machine

1. Many services need to reboot the VM to get things to work.





## Notes

### General

If you use the default install in Virtual box, there should be a default user that you can use.

Default credential

```
vboxuser
changeme
```

### VM automated install.

If VirtualBox is able to do the unattended install, it will probably be able to do the guest installs.

## Scratch

```sh
export SUDO_PASS=changeme && export GIT_EMAIL="foo@bar.com" && export GIT_NAME="Hubert Wong" && rm -rf ~/zzz/xubuntuDesktopConfig && mkdir -p ~/zzz/xubuntuDesktopConfig && cd ~/zzz/xubuntuDesktopConfig && echo $SUDO_PASS | sudo -S apt update && echo $SUDO_PASS | sudo -S apt -y upgrade && echo $SUDO_PASS | sudo -S apt -y autoclean && echo $SUDO_PASS | sudo -S apt -y autoremove && echo $SUDO_PASS | sudo -S apt -y install ansible git && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git . && ansible-playbook -v --extra-vars "ansible_become_pass=$SUDO_PASS" prod/initialSetup/site-deb.yaml
```