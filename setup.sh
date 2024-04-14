#!/usr/bin/env bash

# Do not change the order.
WILL_BE_INSTALLED=(
	curl
	git
	go
	ghq
	lg
	cargo
	hx
	bat
	fd
	rg
)	

#
# helper functions
#
install_curl() {
	sudo apt install curl
}

install_git() {
	sudo apt install git
}

install_go() {
	curl -LO https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
}

install_ghq() {
	go install github.com/x-motemen/ghq@latest
}

install_lg() {
	go install github.com/jesseduffield/lazygit@latest
	path="$(command -v lazygit)"
	[[ -n $path ]] && ln -s $path $(dirname $path)/lg
}

install_cargo() {
	curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
	source "$HOME/.cargo/env"
}

install_hx() {
	sudo add-apt-repository ppa:maveonair/helix-editor
	sudo apt install helix
}

install_bat() {
	sudo apt install bat
	ln -s /usr/bin/batcat /usr/bin/bat
}

install_fd() {
	sudo apt install fd-find
	ln -s /usr/bin/fdfind /usr/bin/fd
}

install_rg() {
	cargo install ripgrep
}

check_and_install() {	
	[[ -z `command -v $1` ]] && echo "[+] Starting install $1..." && install_$1
}

#
# main
#
sudo apt update
for cmd in ${WILL_BE_INSTALLED[@]}; do
	check_and_install $cmd
done
