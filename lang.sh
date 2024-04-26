WILL_BE_INSTALLED=(
    go
    cargo
)

is_installed() {
    if command -v $1>/dev/null; then 
        echo $1 is already installed
        return 0
    else
        return 1
    fi
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

for lang in ${WILL_BE_INSTALLED[@]}; do
    is_installed $lang || install_$lang
done
