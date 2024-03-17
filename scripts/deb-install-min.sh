#!/bin/bash
set -e

# Check if variable is defined.
# $1 - variable name
# $2 - variable to check
function is_defined {
    if [ -z "$2" ]; then
        echo $1" is not defined"
        exit 1
    fi
}

is_defined 'SUDO_PASS' $SUDO_PASS
is_defined 'GIT_EMAIL' $GIT_EMAIL
is_defined 'GIT_PASSWORD' $GIT_NAME
is_defined 'GIT_BRANCH' $GIT_BRANCH

#export SUDO_PASS=changeme 
#export GIT_EMAIL="foo@bar.com"
#export GIT_NAME="Hubert Wong"
INSTALL_DIR=/tmp/vm-configs

# echo "> Recreating the install directory"
# rm -rf /tmp/vm-configs
# mkdir -p /tmp/vm-configs
# cd /tmp/vm-configs

echo "> Install ansible and git"
echo $SUDO_PASS | sudo -S apt update && echo $SUDO_PASS | sudo -S apt -y upgrade 
echo $SUDO_PASS | sudo -S apt -y autoclean
echo $SUDO_PASS | sudo -S apt -y autoremove
echo $SUDO_PASS | sudo -S apt -y install ansible git

echo "> Clone the repo"
git clone https://github.com/hubertwwong/vm-configs.git
cd vm-configs
git checkout $GIT_BRANCH

echo "> Installing"
ansible-playbook -v --extra-vars "ansible_become_pass=$SUDO_PASS" debian/site.yaml