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

echo "> Validate variables"
is_defined 'SUDO_PASS' $SUDO_PASS
is_defined 'GIT_EMAIL' $GIT_EMAIL
is_defined 'GIT_PASSWORD' $GIT_NAME
is_defined 'GIT_BRANCH' $GIT_BRANCH
is_defined 'PLAYBOOK' $PLAYBOOK

echo "> Install required packages"
echo $SUDO_PASS | sudo -S apt update && echo $SUDO_PASS | sudo -S apt -y upgrade 
echo $SUDO_PASS | sudo -S apt -y autoclean
echo $SUDO_PASS | sudo -S apt -y autoremove
echo $SUDO_PASS | sudo -S apt -y install ansible git

echo "> Installing"
ansible-playbook -v --extra-vars "ansible_become_pass=$SUDO_PASS" "debian/"$PLAYBOOK".yaml"