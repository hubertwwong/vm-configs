#!/bin/bash
echo "> .bash_aliases"

# PATHS
##############################################################################

# MUST CHANGE
# You want to set these per machine.
ZZ_SYNC_DIR="/home/hubert/sync/vagrant"
ZZ_SCRIPTS_DIR="~/configs/vm_configs"
#source scripts_env.sh

# Other directories.

# Other ENV
##############################################################################
export email="hubertwwong@gmail.com"

# Color schemes constants
##############################################################################

FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white
RST="\e[m" # RESET

# Prompt
##############################################################################

# Display a git branch
# https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
# Note: This is my variant that just has the branch name without the extra paren
# git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'
}

kube_get_context() {
  kubectl config current-context
}

# Save the default prompt if you want to go back to it.
DEFAULT_PROMPT=$PS1
alias aaPromptDefault="PS1=$DEFAULT_PROMPT"

# Custom Prompt
CUST1_PROMPT="[\u][\w][\@]\n$ "
CUST2_PROMPT="$RST[$FBLE\u$RST][$FBLE\w$RST][$FBLE\D{%r}$RST][$FBLE\$(parse_git_branch)$RST]\n$ "
KUBE_PROMPT="$RST[$FBLE\u$RST][$FBLE\w$RST][$FBLE\D{%r}$RST][$FBLE\$(parse_git_branch)$RST][$FBLE\$(kube_get_context)$RST]\n$ "
CUST_NONAME_PROMPT="$RST[$FBLE\w$RST][$FBLE\@$RST]\n$ "
PS1=$CUST2_PROMPT

# Functions
##############################################################################

## Docker
## 
## See this url for docker-ips
## https://stackoverflow.com/questions/17157721/how-to-get-a-docker-containers-ip-address-from-the-host

# List all containers
# docker-ips
docker-ips() {
    docker inspect --format='{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
}

# List a speicific IP of a docker container
# docker-ip YOUR_CONTAINER_ID
docker-ip() {
  docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$@"
}

# Aliases
##############################################################################

# Unsorted
##############################################################################

# LS
####
alias l2="ls -alF"
alias la="ls -A"
alias ld="ls -ld */"   # List in long format, only directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Edit aliases
alias aaEditAliases="code $ZZ_SCRIPTS_DIR/dotfiles"
alias aaEditScripts="code $ZZ_SCRIPTS_DIR/scripts"

# Bash scripts are stored in bin directory allow them to execute from any where as long as its in the path.
export PATH=$PATH:$ZZ_SCRIPTS_DIR/bin
alias aaChmodXScripts="chmod +x $ZZ_SCRIPTS_DIR/bin/*"

# APT
######

# Simple helper reduce typing
alias aaAptInstall="sudo apt -y update && sudo apt -y install"

# Init this file.
# alias aaUpdateBash="cp $ZZ_SCRIPTS_DIR/.bash_aliases ~/;source .bashrc"

# Misc
alias aaOwnDir="sudo chown -R $USER:$USER ."

# Free space shortcuts
alias aaFree2="du -h --max-depth=2 | sort -n"
alias aaFree1="du -h --max-depth=1 | sort -n"
alias aaClean="yarn cache clean; docker system prune -a -f;"
# Probably a cron is better.



# Shell helpers
##############################################################################

# TMUX
#######
# [[ $TERM != "screen" ]] && exec tmux



# Git
##############################################################################

alias ggi="git init"
alias gga="git add ."
alias ggc="git commit -m"
alias ggf="git fetch"
alias ggs="git status"



# Programming Langs
##############################################################################
 
# Golang
########

# Path for golang binary
export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin
# local/bin is for python pip
# /usr/local/go/bin is for golang

# Java
######

# Base assumption. This is using the ubuntu install of jdk and maven

# JAVA HOME required for maven
# export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Node
######

#alias aaNodeCleanNPM="find . -name "node_modules" -type d -prune -exec rm -rf '{}' +"
alias aaNodeCleanNPM="sudo find . -name "node_modules" -type d -prune -exec rm -rf '{}' +"
# BE CAREFUL WITH THIS COMMAND

# Note: You probably don't need this but I put this for reference.
# When you install nvm, it should put these lines in the bashrc file for you.
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python
########
# Poetry. Assumes its installed. First part if
#[ -d "$HOME/.poetry/env" ] && source $HOME/.poetry/env
# set set python to python 3...
# NOTE: ansible has a ln command. Not required.
# alias python="python3"



# Platform
##############################################################################

# Kubernetes
############

# command 
alias k="kubectl"

# config
alias kcgc="kubectl config get-contexts"
alias kcuc="kubectl config use-context"
alias kccc="kubectl config current-context"
alias kcgcl="kubectl config get-clusters"

# get
alias kgcr="kubectl get ClusterRoles"
alias kgcrb="kubectl get ClusterRoleBindings"
alias kgcm="kubectl get ConfigMaps"
alias kgcj="kubectl get Cronjob"
alias kgds="kubectl get DaemonSets"
alias kgd="kubectl get Deployments"
alias kgpv="kubectl get pv"
alias kgpvc="kubectl get pvc"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgsa="kubectl get ServiceAccounts"
alias kgss="kubectl get StatefulSets"

# describe
alias kdcr="kubectl describe ClusterRole"
alias kdcrb="kubectl describe ClusterRoleBinding"
alias kdcm="kubectl describe ConfigMap"
alias kdcj="kubectl describe Cronjob"
alias kdds="kubectl describe DaemonSet"
alias kdd="kubectl describe Deployment"
alias kdpv="kubectl describe pv"
alias kdpvc="kubectl describe pvc"
alias kdp="kubectl describe pod"
alias kds="kubectl describe service"
alias kdsa="kubectl describe ServiceAccount"
alias kdss="kubectl describe StatefulSet"

# delete
alias kxcr="kubectl delete ClusterRole"
alias kxcrb="kubectl delete ClusterRoleBinding"
alias kxcm="kubectl delete ConfigMap"
alias kxcj="kubectl delete Cronjob"
alias kxds="kubectl delete DaemonSet"
alias kxd="kubectl delete Deployment"
alias kxpv="kubectl delete pv"
alias kxpvc="kubectl delete pvc"
alias kxp="kubectl delete pod"
alias kxs="kubectl delete service"
alias kxsa="kubectl delete ServiceAccount"
alias kxss="kubectl delete StatefulSet"

# log
alias kl="kubectl logs"
alias klf="kubectl logs --follow"

# unsorted
alias kgn="kubectl get namespaces"
alias ka="kubectl apply -f"

# Minikube
##########

# command
# alias mk="minikube"
# alias mkStart="minikube start --memory=4g && minikube addons enable ingress && minikube addons enable dashboard && minikube addons enable metrics-server"
# alias mkRestart="minikube delete && mkStart"

# upgrade to the latest
# alias mkUpgrade="sudo rm -rf /usr/local/bin/minikube && sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && sudo chmod +x minikube && sudo cp minikube /usr/local/bin/ && sudo rm minikube"

# general
# alias mkd="minikube dashboard"
# alias mkse="minikube service"
# alias mkst="minikube start"
# alias mkde="minikube delete"

# GO
##############################################################################

# Paths
alias aaGoDocker="cd $ZZ_SYNC_DIR/docker"
alias aaGoStudy="cd $ZZ_SYNC_DIR/study"
alias aaGoNotes="cd $ZZ_SYNC_DIR/study"
alias aaGoScripts="cd $ZZ_SCRIPTS_DIR"
alias aaGoSync="cd $ZZ_SYNC_DIR"

# USB download directory for ubuntu.
alias aaGoUSBDownload="cd /media/*/*/downloads"


# Update scripts
##############################################################################

alias aaInstallVMGuest="sudo bash /media/$USER/V*/VBoxLinuxAdditions.run --nox11"
alias aaUpgradeSys="sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoremove && sudo apt -y autoclean"
alias aaUpgradeAll="ansible-playbook -v --ask-become-pass $ZZ_SCRIPTS_DIR/prod/initialSetup/site-all.yaml"
alias aaSourceBashrc="source ~/.bashrc"