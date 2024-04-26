WILL_BE_INSTALLED=(
    ghq
    lg
    hx
)

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
    ln -Ts $PWD/runtime ~/.config/helix/runtime

	mkdir -p $HOME/.config/helix
	sudo ln -s `ghq root`/github.com/tm99hjkl/dotfiles/.config/helix/config.toml $HOME/.config/helix/config.toml
	sudo ln -s `ghq root`/github.com/tm99hjkl/dotfiles/.config/helix/languages.toml $HOME/.config/helix/languages.toml
}

for cmd in ${WILL_BE_INSTALLED[@]}; do
	install_$cmd
done
