#!/bin/bash

set -euo pipefail

# command_exists() {
# 	command -v "$@" > /dev/null 2>&1
# }


#function create_vim_undodir() {
#  mkdir -p "$HOME/.vim/undodir"
#}


download_nvim_plug() {
    curl -fsSL https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.config/nvim/autoload/plug.vim --create-dirs
}


# Works for bash and zsh
download_git_completion() {
    curl -fsSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.local/git/git-completion.bash
}


install_macos_homebrew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}


# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
install_macos_aws_cli() {
    curl -fsSL "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
}


install_macos_rust() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}


create_dirs() {
    mkdir -p "$HOME/Downloads"
    mkdir -p "$HOME/bin"
}


apt_update() {
    sudo apt-get update -qq > /dev/null
}


apt_install() {
    sudo apt-get install -qq --no-install-recommends "$@" > /dev/null
}


# Notice we assume a Debian x64 installation
install_docker() {
    local apt_repo="deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    local pre_reqs='docker-ce docker-ce-cli containerd.io'

    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo "$apt_repo" > /etc/apt/sources.list.d/docker.list

    apt_update
    apt_install $pre_reqs
}


post_install_docker() {
    sudo groupadd docker
    sudo usermod -aG docker $USER
}


# https://dev.to/bowmanjd/install-docker-on-windows-wsl-without-docker-desktop-34m9
setup_docker_wsl2() {
    # Share a common group ID for group docker
    local common_group_id=36257
    local docker_dir=/mnt/wsl/shared-docker
    local sudoers_file=/etc/sudoers.d/99_docker

    if getent group | grep -q $common_group_id; then
        echo "Group ID $common_group_id not available. Choose a different number"
        exit 1
    fi

    sudo groupmod -g $common_group_id docker

    sudo mkdir /etc/docker
    printf "{\n\t\"hosts\": [\"unix://$docker_dir/docker.sock\"],\n\t\"iptables\": false\n}" > /etc/docker/daemon.json

    sudo bash -c "echo '%docker ALL=(ALL)  NOPASSWD: /usr/bin/dockerd' >> $sudoers_file"
    sudo chmod 440 $sudoers_file

    # intentionally leave out the -q flag to display error messages
    if ! sudo visudo -cf $sudoers_file > /dev/null; then
        exit 1
    fi
}


# https://ohmyposh.dev/docs/linux
# does not work for macOS! https://ohmyposh.dev/docs/macos
install_oh_my_posh() {
    local bin_file="$HOME/bin/oh-my-posh"
    # local themes="$HOME/.config/oh-my-posh/themes"

    # mkdir -p "$themes"

    curl -fsSL https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -o "$bin_file"
    sudo chmod +x "$bin_file"

    # curl -fsSL https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -o "$themes/themes.zip"
    # unzip "$themes/themes.zip"
    # rm "$themes/themes.zip"
    # chmod u+rw "$themes/*.json"
}


install_volta() {
    curl -fsSL https://get.volta.sh | bash -s -- --skip-setup > /dev/null
}


download_caskaydia_cove_font() {
    download_nerd_font CascadiaCode Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono.otf
}


download_hack_font() {
    download_nerd_font Hack Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
}


download_nerd_font() {
    local patched_font=$1
    local font_file=$2

    # echo "Downloading $patched_font font..."
    local url="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/$patched_font/Regular/complete/$font_file"

    curl -fsSL "$url" -o "$HOME/Downloads/$(echo $font_file | tr -d %20)"
}


stow_debian() {
    stow --dotfiles --target $HOME common debian
}


stow_wsl2_debian() {
    stow --dotfiles --target $HOME common wsl2_debian
}


# Assumes the .vimrc has already been stowed
# @deprecated Utilize vim-plug instead
setup_vundle() {
    git clone -q https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"

    # https://vi.stackexchange.com/a/15564
    # Setup without prompting for confirmation or displaying misleading error
    # messages
    vim -E -s -u "$HOME/.vimrc" +PluginInstall +qall
}


# APT specific
# Docker is installed on another function
install_apt_requirements() {
    local pre_reqs='
    apt-transport-https
    bash-completion
    ca-certificates
    curl
    git
    git-doc
    gnupg2
    gpg-agent
    lsb-release
    man-db
    python3
    stow
    tmux
    vim-gtk
    '

    apt_update
    apt_install $pre_reqs
}


# `ripgrep` and `fd` were installed after performing `:checkhealth telescope`
# https://github.com/nvim-telescope/telescope.nvim
# https://github.com/burntsushi/ripgrep
# https://github.com/sharkdp/fd
install_brew_requirements() {
    # https://ohmyposh.dev/docs/macos
    #gnupg aka gnupg2

    # TODO finish the extensive list
    # TODO --cask flag? Still unclear its usage
    local pre_reqs='
    fd
    karabiner-elements
    iterm2
    jq
    neovim
    ripgrep
    stow
    tmux
    watchman
    '

    brew install $pre_reqs
}

