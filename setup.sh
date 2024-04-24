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
	z
)	

#
# helper functions
#
install_curl() {
	sudo apt install -y curl
}

install_git() {
	sudo apt install -y git
}

install_go() {
	curl -LO https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
	if ! [[ $PATH = */usr/local/go/bin* ]]; then
		echo '# go' >> ~/.bashrc
		echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
		echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
	fi
	source "$HOME/.bashrc"
}

install_ghq() {
	go install github.com/x-motemen/ghq@latest
	ghq get https://github.com/tm99hjkl/dotfiles
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
	sudo apt install -y helix
	mkdir -p $HOME/.config/helix
	sudo ln -s `ghq root`/github.com/tm99hjkl/dotfiles/.config/helix/config.toml $HOME/.config/helix/config.toml
	sudo ln -s `ghq root`/github.com/tm99hjkl/dotfiles/.config/helix/languages.toml $HOME/.config/helix/languages.toml
}

install_bat() {
	sudo apt install -y bat
	sudo ln -s /usr/bin/batcat /usr/bin/bat
}

install_fd() {
	sudo apt install -y fd-find
	sudo ln -s /usr/bin/fdfind /usr/bin/fd
}

install_rg() {
	sudo apt install -y ripgrep
	sudo ln -s /usr/bin/ripgrep /usr/bin/rg
}

install_z() {
	ghq get https://github.com/rupa/z
	echo '# z' >> ~/.bashrc
	echo ". $HOME/ghq/github.com/rupa/z/z.sh" >> ~/.bashrc
	source $HOME/.bashrc
}

check_and_install() {	
	[[ -z `command -v $1` ]] && echo "[+] Starting install $1..." && install_$1 1>/dev/null
}

#
# main
#
sudo apt update
for cmd in ${WILL_BE_INSTALLED[@]}; do
	check_and_install $cmd
done
