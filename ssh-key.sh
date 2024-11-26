#!/usr/bin/bash
NAME=$(whoami)
if [[ $NAME != 'hl1276' ]];then
    echo "not on remote server"
    exit
fi

#REMOTE=$1
#
#ssh -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" $REMOTE 'mkdir /users/hl1276/.ssh'
#
#scp -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" "$HOME/.ssh/id_rsa_rutgers_cloudlab" "$REMOTE:/users/hl1276/.ssh/"
#ssh -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" $REMOTE 'cd /users/hl1276/.ssh && git clone git@github.com:0xDkXy/cloudlab-init.git && cd cloudlab-init && ./install-pkgs.sh && ./init.sh'
