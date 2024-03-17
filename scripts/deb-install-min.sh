#!/bin/bash
set -e

export SUDO_PASS=changeme 
export GIT_EMAIL="foo@bar.com"
export GIT_NAME="Hubert Wong"
INSTALL_DIR=/tmp/vm-configs

echo "> Recreating the install directory"
rm -rf /tmp/vm-configs
mkdir -p /tmp/vm-configs
cd /tmp/vm-configs

echo "> Install ansible and git"
echo $SUDO_PASS | sudo -S apt update && echo $SUDO_PASS | sudo -S apt -y upgrade 
echo $SUDO_PASS | sudo -S apt -y autoclean
echo $SUDO_PASS | sudo -S apt -y autoremove
echo $SUDO_PASS | sudo -S apt -y install ansible git

echo "> Cloen the repo"
git clone https://github.com/hubertwwong/xubuntuDesktopConfig.git . 
ansible-playbook -v --extra-vars "ansible_become_pass=$SUDO_PASS" prod/initialSetup/site-deb.yaml