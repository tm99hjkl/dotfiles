# install go
 curl -LO https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
 sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
 echo
 
 # install rust
 curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
 source "$HOME/.cargo/env"
 
 # install helix
 sudo add-apt-repository ppa:maveonair/helix-editor
 sudo apt update
 sudo apt install helix
 
 # install ghq
 go isntall github.com/x-motemen/ghq@latest
 
 # install dotfiles
 ghq get https://github.com/tm99hjkl/dotfiles
 
 # install bat
 sudo apt install bat
 mkdir -p ~/.local/bin
 ln -s /usr/bin/batcat ~/.local/bin/bat
 
 # install node
 curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
 export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
 nvm install node
