WILL_BE_INSTALLED=(
    curl
    git
    bat
    fd
    rg
)

is_installed() {
    if command -v $1>/dev/null; then 
        echo $1 is already installed
        return 0
    else
        return 1
    fi
}

install_curl() {
    sudo apt install -y curl
}

install_git() {
    sudo apt install -y git
}

install_bat() {
    sudo apt install -y bat
	sudo ln -s /usr/bin/batcat /usr/bin/bat
}

install_fd() {
    sudo apt install -y fd-find && sudo ln -s /usr/bin/fdfind /usr/bin/fd
}

install_rg() {
    sudo apt install -y ripgrep
}

sudo apt update
sudo apt install build-essential

for bin in ${WILL_BE_INSTALLED[@]}; do
    is_installed $bin || install_$bin
done
