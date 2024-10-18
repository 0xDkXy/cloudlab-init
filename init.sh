#!/bin/bash

dotcp() {
    cp $1 "~/$1"
}

dotcp .vimrc
dotcp .tmux.conf

co ./ssh.config ~/.ssh/config
