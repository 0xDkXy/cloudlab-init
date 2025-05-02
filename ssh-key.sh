#!/usr/bin/bash

REMOTE=$1
REMOTE_HOME="/users/hl1276"

if [[ ${REMOTE} =~ ^cc ]]; then
    REMOTE_HOME="/home/cc"
elif [[ ${REMOTE} =~ ^optane ]]; then
    REMOTE_HOME="/home/hl1276"
fi

if [[ -z $REMOTE ]];then
    echo "input remote server address"
    exit
fi

ssh -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" $REMOTE "mkdir ${REMOTE_HOME}/.ssh"

scp -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" "$HOME/.ssh/id_rsa_rutgers_cloudlab" "$REMOTE:${REMOTE_HOME}/.ssh/"

scp -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" "./ssh.config" "$REMOTE:${REMOTE_HOME}/.ssh/config"

ssh -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" $REMOTE "cd ${REMOTE_HOME}/ && yes | git clone https://github.com/0xDkXy/cloudlab-init.git && cd cloudlab-init && ./install-pkgs.sh && ./init.sh"
