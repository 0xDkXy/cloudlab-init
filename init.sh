#!/bin/bash

dotcp() {
    cp $1 ~/$1
}

dotcp .vimrc
dotcp .tmux.conf
dotcp .gitconfig

cp ./ssh.config ~/.ssh/config

echo 'set -o vi' >> ~/.bashrc
