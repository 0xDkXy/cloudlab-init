#!/usr/bin/bash

REMOTE=$1

if [[ -z $REMOTE ]];then
    echo "input remote server address"
    exit
fi

ssh -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" $REMOTE 'mkdir /users/hl1276/.ssh'

scp -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" "$HOME/.ssh/id_rsa_rutgers_cloudlab" "$REMOTE:/users/hl1276/.ssh/"
scp -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" "./ssh.config" "$REMOTE:/users/hl1276/.ssh/config"

ssh -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" $REMOTE 'cd /users/hl1276/ && yes | git clone git@github.com:0xDkXy/cloudlab-init.git && cd cloudlab-init && ./install-pkgs.sh && ./init.sh'
