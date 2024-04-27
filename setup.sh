#!/bin/bash
set -eo pipefail

WILL_BE_INSTALLED=(
    gcc
    git 
    go
    cargo
    z
)

is_installed() {
    if command -v $1 >/dev/null; then return 0; else return 1; fi
}

install_gcc() {
    sudo apt install -y build-essential
}

install_git() {
    sudo apt install -y git
}

install_go() {
    curl -LO https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz

    if [[ $PATH = */usr/local/go/bin* ]]; then return; fi

    cat <<EOF >>$HOME/.bashrc
# go
export PATH=\$PATH:/usr/local/go/bin
export PATH=\$PATH:\$HOME/go/bin

EOF

    rm  go1.21.0.linux-amd64.tar.gz
}

install_cargo() {
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y

    if grep 'source $HOME/.cargo/env' $HOME/.bashrc >/dev/null; then return; fi

    cat <<EOF >>$HOME/.bashrc
# rust
source \$HOME/.cargo/env

EOF
}

install_z() {
    # HACK: Install as if installed by `ghq get` so that `source ~/.bashrc` 
    # only needs to be done once.
    mkdir -p $HOME/ghq/github.com/rupa/z
    git clone https://github.com/rupa/z $HOME/ghq/github.com/rupa/z

    if grep 'source $HOME/ghq/github.com/rupa/z' $HOME/.bashrc >/dev/null; then return; fi

    cat <<EOF >>$HOME/.bashrc
# z
source \$HOME/ghq/github.com/rupa/z/z.sh

EOF
}

sudo apt update
for pkg in ${WILL_BE_INSTALLED[@]}; do
    is_installed $pkg || install_$pkg
done
