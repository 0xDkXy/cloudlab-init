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

REMOTE_EXEC() {
    local _CMD="$1"
    ssh -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" $REMOTE $_CMD
}

REMOTE_COPY() {
    local src="$1"
    local dest="$2"
    scp -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" $src $dest
}

REMOTE_EXEC "mkdir ${REMOTE_HOME}/.ssh"

REMOTE_COPY "$HOME/.ssh/id_rsa_rutgers_cloudlab" "$REMOTE:${REMOTE_HOME}/.ssh/"

REMOTE_COPY "./ssh.config" "$REMOTE:${REMOTE_HOME}/.ssh/config"

REMOTE_EXEC "cd ${REMOTE_HOME}/ && yes | git clone https://github.com/0xDkXy/cloudlab-init.git && cd cloudlab-init && ./init.sh"
