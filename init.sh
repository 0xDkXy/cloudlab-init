#!/bin/bash

dotcp() {
    cp $1 ~/$1
}

install_codex() {
    curl -fsSL https://chatgpt.com/codex/install.sh | sh
    source $HOME/.bashrc
    codex plugin marketplace add DietrichGebert/ponytail
    codex plugin add ponytail@ponytail
}

dotcp .vimrc
dotcp .tmux.conf
dotcp .gitconfig
dotcp .wakatime.cfg

cp ./ssh.config ~/.ssh/config

echo 'set -o vi' >> ~/.bashrc
echo 'export EDITOR=nvim' >> ~/.bashrc

install_codex
