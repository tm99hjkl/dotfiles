SHELL := /bin/bash
GO_VERSION := 1.25.2
GO := /usr/local/go/bin/go
GHQ := $$HOME/go/bin/ghq
CARGO := $$HOME/.cargo/bin/cargo
RUSTUP := $$HOME/.cargo/bin/rustup
MOLD := /usr/local/bin/mold

all: docker lazygit uv z helix ghidra misc

setup:
	sudo apt update
	sudo apt install -y gcc g++ git curl

docker: setup
	sudo apt install -y ca-certificates
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc
	sudo bash -c 'echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu `. /etc/os-release && echo "$${UBUNTU_CODENAME:-$$VERSION_CODENAME}"` stable" > /etc/apt/sources.list.d/docker.list'
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

go: setup
	if ! [ -f $(GO) ] || ! [[ "$$($(GO) version)" =~ $(GO_VERSION) ]]; then \
		sudo rm -rf /usr/local/go; \
		curl -LO https://go.dev/dl/go$(GO_VERSION).linux-amd64.tar.gz; \
		sudo tar -C /usr/local -xzf go$(GO_VERSION).linux-amd64.tar.gz; \
		rm go$(GO_VERSION).linux-amd64.tar.gz; \
	fi

cargo: setup
	curl https://sh.rustup.rs -sSf | sh

uv: setup
	curl -LsSf https://astral.sh/uv/install.sh | sh

ghq: go
	if ! [ -f $(GHQ) ]; then \
		$(GO) install github.com/x-motemen/ghq@latest; \
	fi

lazygit: go
	$(GO) install github.com/jesseduffield/lazygit@latest

mold: ghq
	if ! [ -f $(MOLD) ]; then \
		$(GHQ) get --branch stable https://github.com/rui314/mold.git; \
		cd $$HOME/ghq/github.com/rui314/mold && \
		sudo ./install-build-deps.sh && \
		cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=c++ -B build && \
		cmake --build build -j$$(nproc) && \
		sudo cmake --build build --target install; \
	fi

dotfiles: ghq
	$(GHQ) get https://github.com/tm99hjkl/dotfiles
	cd $$HOME/ghq/github.com/tm99hjkl/dotfiles && \
	ln -fs {$$PWD,$$HOME}/.bashrc && \
	ln -fs {$$PWD,$$HOME}/.bash_aliases && \
	ln -fs {$$PWD,$$HOME}/.inputrc && \
	ln -fs {$$PWD,$$HOME}/.vimrc

z: dotfiles ghq
	$(GHQ) get https://github.com/rupa/z

helix: ghq mold cargo dotfiles
	$(GHQ) get https://github.com/helix-editor/helix
	cd $$HOME/ghq/github.com/helix-editor/helix && \
	git pull && \
	mold -run $(CARGO) install --path helix-term --locked && \
	mkdir -p $$HOME/.config/helix/ && \
	ln -Tfs $${PWD}/runtime $$HOME/.config/helix/runtime
	cd $$HOME/ghq/github.com/tm99hjkl/dotfiles && \
	ln -fs {$$PWD,$$HOME}/.config/helix/config.toml && \
	ln -fs {$$PWD,$$HOME}/.config/helix/languages.toml && \
	ln -fs {$$PWD,$$HOME}/.config/helix/runtime/themes/tm.toml
	$(RUSTUP) component add rust-analyzer
	sudo apt install -y clangd-19
	sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-19 100
	sudo snap install marksman
	sudo apt install -y python3-pylsp

ghidra:
	if ! [ -f /usr/local/bin/ghidra ]; then \
		sudo apt install openjdk-21-jdk; \
		wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.3.1_build/ghidra_11.3.1_PUBLIC_20250219.zip; \
		sudo unzip ghidra_11.3.1_PUBLIC_20250219.zip -d /opt && rm ghidra_11.3.1_PUBLIC_20250219.zip; \
		sudo ln -sf /opt/ghidra_11.3.1_PUBLIC/ghidraRun /usr/local/bin/ghidra; \
	fi

ruby:
	sudo apt install -y ruby-full

misc:
	sudo apt install -y wireguard cloc tmux tree xsel

### My private setting. This recipe is not included in `all`.

private: dotfiles
	if ! [ -d ~/memo ]; then \
		cd ~ && \
		git clone git@github.com:tm99hjkllogseq/memo; \
		cd memo && \
		git config user.name "tm99hjkllogseq" && \
		git config user.email "tm99hjkllogseq@gmail.com" && \
		sudo ln -fs $$PWD/memo /usr/local/bin/memo && \
		sudo ln -fs $$PWD/task /usr/local/bin/task; \
	fi
	cd $$HOME/ghq/github.com/tm99hjkl/dotfiles && \
	ln -fs {$$PWD,$$HOME}/.gitconfig
