#!/bin/bash

dotcp() {
    cp $1 "~/$1"
}

dotcp .vimrc
dotcp .tmux.conf

cp ./ssh.config ~/.ssh/config
