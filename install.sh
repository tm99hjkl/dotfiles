#!/bin/bash
set -eo pipefail

WILL_BE_INSTALLED=(
    curl
    bat
    fd
    rg
    ghq
    lg
    hx
)

is_installed() {
    if command -v $1 >/dev/null; then return 0; else return 1; fi
}

install_curl() {
    sudo apt install -y curl
}

install_bat() {
    sudo apt install -y bat && sudo ln -s /usr/bin/batcat /usr/bin/bat
}

install_fd() {
    sudo apt install -y fd-find && sudo ln -s /usr/bin/fdfind /usr/bin/fd
}

install_rg() {
    sudo apt install -y ripgrep
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

install_hx() {
    ghq get https://github.com/helix-editor/helix
    cd `ghq root`/github.com/helix-editor/helix
    cargo install --path helix-term --locked

	mkdir -p $HOME/.config/helix
    sudo ln -Ts $PWD/runtime ~/.config/helix/runtime
	sudo ln -s `ghq root`/github.com/tm99hjkl/dotfiles/.config/helix/config.toml $HOME/.config/helix/config.toml
	sudo ln -s `ghq root`/github.com/tm99hjkl/dotfiles/.config/helix/languages.toml $HOME/.config/helix/languages.toml
}

for bin in ${WILL_BE_INSTALLED[@]}; do
    is_installed $bin || install_$bin
done
