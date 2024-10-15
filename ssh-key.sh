#!/usr/bin/bash

REMOTE=$1

ssh -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" $REMOTE 'mkdir /users/hl1276/.ssh'

scp -i "$HOME/.ssh/id_rsa_rutgers_cloudlab" "$HOME/.ssh/id_rsa_rutgers_cloudlab" "$REMOTE:/users/hl1276/.ssh/"
