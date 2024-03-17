# xubuntuDesktopConfig

Just an ansible version of the setup.
Mostly doing this for pratice

## instructions

1. Create a directory
2. Clone the repo
3. Install ansible
4. Run the site all yaml

## One liners

***MODIFY GIT_NAME, GIT_EMAIL, and SUDO_PASS***

Debian

```
export SUDO_PASS=changeme && export GIT_EMAIL="foo@bar.com" && export GIT_NAME="Hubert Wong" && rm -rf ~/zzz/xubuntuDesktopConfig && mkdir -p ~/zzz/xubuntuDesktopConfig && cd ~/zzz/xubuntuDesktopConfig && echo $SUDO_PASS | sudo -S apt update && echo $SUDO_PASS | sudo -S apt -y upgrade && echo $SUDO_PASS | sudo -S apt -y autoclean && echo $SUDO_PASS | sudo -S apt -y autoremove && echo $SUDO_PASS | sudo -S apt -y install ansible git && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git . && ansible-playbook -v --extra-vars "ansible_become_pass=$SUDO_PASS" prod/initialSetup/site-deb.yaml
```

General install without GNOME

```
export SUDO_PASS=password && rm -rf ~/zzz/xubuntuDesktopConfig && mkdir -p ~/zzz/xubuntuDesktopConfig && cd ~/zzz/xubuntuDesktopConfig && echo $SUDO_PASS | sudo -S apt update && echo $SUDO_PASS | sudo -S apt-get -y remove --purge libreoffice* thunderbird && echo $SUDO_PASS | sudo -S apt -y upgrade && echo $SUDO_PASS | sudo -S apt -y autoclean && echo $SUDO_PASS | sudo -S apt -y autoremove && echo $SUDO_PASS | sudo -S apt -y install ansible git && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git . && GIT_NAME="Hubert Wong" GIT_EMAIL="foo@bar.com" ansible-playbook -v --extra-vars "ansible_become_pass=$SUDO_PASS" prod/initialSetup/site-min.yaml
```

General install

```
export SUDO_PASS=password && rm -rf ~/zzz/xubuntuDesktopConfig && mkdir -p ~/zzz/xubuntuDesktopConfig && cd ~/zzz/xubuntuDesktopConfig && echo $SUDO_PASS | sudo -S apt update && echo $SUDO_PASS | sudo -S apt-get -y remove --purge libreoffice* thunderbird && echo $SUDO_PASS | sudo -S apt -y upgrade && echo $SUDO_PASS | sudo -S apt -y autoclean && echo $SUDO_PASS | sudo -S apt -y autoremove && echo $SUDO_PASS | sudo -S apt -y install ansible git && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git . && GIT_NAME="Hubert Wong" GIT_EMAIL="foo@bar.com" ansible-playbook -v --extra-vars "ansible_become_pass=$SUDO_PASS" prod/initialSetup/site-all.yaml
```

General install with 18.04
```
export SUDO_PASS=password && rm -rf ~/zzz/xubuntuDesktopConfig && mkdir -p ~/zzz/xubuntuDesktopConfig && cd ~/zzz/xubuntuDesktopConfig && echo $SUDO_PASS | sudo -S apt update && echo $SUDO_PASS | sudo -S apt-get -y remove --purge libreoffice* thunderbird && echo $SUDO_PASS | sudo -S apt -y upgrade && echo $SUDO_PASS | sudo -S apt -y autoclean && echo $SUDO_PASS | sudo -S apt -y autoremove && echo $SUDO_PASS | sudo -S apt -y install ansible git && echo $SUDO_PASS | sudo -S snap install --classic vscode && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git . && GIT_NAME="Hubert Wong" GIT_EMAIL="foo@bar.com" ansible-playbook -v  --extra-vars "ansible_become_pass=$SUDO_PASS" prod/initialSetup/site-18.04.yaml
```

Testing
```
export SCRIPT_DIR=~/zzz && mkdir -p $SCRIPT_DIR && sudo apt update && sudo apt-get -y remove --purge libreoffice* thunderbird && sudo apt -y upgrade && sudo apt -y autoclean && sudo apt -y autoremove && sudo apt -y install ansible git && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git && GIT_NAME="Hubert Wong" GIT_EMAIL="foo@bar.com" ansible-playbook -v --ask-become-pass $SCRIPT_DIR/xubuntuDesktopConfig/prod/initialSetup/site-all-test01.yaml
```

testing 2
```
export SCRIPT_DIR=~/zzz && sudo apt update && sudo apt-get -y remove --purge libreoffice* thunderbird && sudo apt -y upgrade && sudo apt -y autoclean && sudo apt -y autoremove && sudo apt -y install ansible git && mkdir -p $SCRIPT_DIR && cd $SCRIPT_DIR && rm -rf xubuntuDesktopConfig && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git && cd xubuntuDesktopConfig && git pull && GIT_NAME="Hubert Wong" GIT_EMAIL="foo@bar.com" ansible-playbook -v --ask-become-pass prod/initialSetup/site-all-test01.yaml
```

testing without ansible snap
```
export SCRIPT_DIR=~/zzz && sudo apt update && sudo apt-get -y remove --purge libreoffice* thunderbird && sudo apt -y upgrade && sudo apt -y autoclean && sudo apt -y autoremove && sudo snap install --classic code && sudo apt -y install ansible git && mkdir -p $SCRIPT_DIR && cd $SCRIPT_DIR && rm -rf xubuntuDesktopConfig && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git && cd xubuntuDesktopConfig && GIT_NAME="Hubert Wong" GIT_EMAIL="foo@bar.com" ansible-playbook -v --ask-become-pass prod/initialSetup/site-all-test01-18-04.yaml
```


General install with a vm guest. 

1. This assumes you are running from the directory of the that contains the VBoxLinuxAdditions.run command. 
2. The `|| true` is to swallow the error that `./VBoxLinuxAdditions.run` might throw and continue the script.
3. You have to mount the guest additions from the GUI. TODO. Make this automated too. Not sure how. I think its just an Oracle thing where there isn't a repo tha contains this file.

Mount CD instructions:
1. Click Devices from menu.
2. Install Guest Additions CD Image
3. Double click the CD icon to mount CD with guest additions.
4. Right click in window and open a terminal here.
5. Paste the following.

Oneliner with guest.
```
sudo apt update && sudo apt-get -y remove --purge libreoffice* thunderbird && sudo apt -y upgrade && sudo apt -y autoclean && sudo apt -y autoremove && sudo apt -y install ansible git && mkdir -p ~/zzz/xubuntuDesktopConfig && cd ~/zzz/xubuntuDesktopConfig && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git . && GIT_NAME="Hubert Wong" GIT_EMAIL="foo@bar.com" ansible-playbook -v --ask-become-pass prod/initialSetup/site-all.yaml cd /media/hubert/*/ && sudo sh -c ./VBoxLinuxAdditions.run || true
```

Oneliner with guest on 18.04.
```
sudo apt update && sudo apt-get -y remove --purge libreoffice* thunderbird && sudo apt -y upgrade && sudo apt -y autoclean && sudo apt -y autoremove && sudo apt -y install ansible git && sudo snap install --classic code && mkdir -p ~/zzz/xubuntuDesktopConfig && cd ~/zzz/xubuntuDesktopConfig  && git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git . && GIT_NAME="Hubert Wong" GIT_EMAIL="foo@bar.com" ansible-playbook -v --ask-become-pass prod/initialSetup/site-18.04.yaml && cd /media/hubert/*/ && sudo sh -c ./VBoxLinuxAdditions.run || true
```

If you want to run a specific playbook, just modify site.yaml and change it to the playbook you want to run.
```
ansible-playbook -v --ask-become-pass prod/initialSetup/site.yaml
```

## Notes

1. `apt-get` needed for for the remove commands.

## TODO

1. More secure version...
2. Some script cleanup.
3. Add some logic to check before doing downloads
4. Some note about putting a symlink on python with python3.
