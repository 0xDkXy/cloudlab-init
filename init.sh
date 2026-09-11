#!/bin/bash


CODEX="$HOME/.local/bin/codex"

dotcp() {
    cp $1 ~/$1
}

install_codex() {
    pushd $HOME
    git clone git@github.com:0xDkXy/codex-config.git
    cd codex-config
    curl -fsSL https://chatgpt.com/codex/install.sh | sh
    source $HOME/.bashrc
    ./install.sh
    $CODEX plugin marketplace add DietrichGebert/ponytail
    $CODEX plugin add ponytail@ponytail

    popd
}

dotcp .vimrc
dotcp .tmux.conf
dotcp .gitconfig
dotcp .wakatime.cfg

cp ./ssh.config ~/.ssh/config

echo 'set -o vi' >> ~/.bashrc
echo 'export EDITOR=nvim' >> ~/.bashrc

install_codex
