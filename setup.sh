#!/bin/bash

set -euo pipefail

command_exists() {
	command -v "$@" > /dev/null 2>&1
}


#function create_vim_undodir() {
#  mkdir -p "$HOME/.vim/undodir"
#}

# https://github.com/altercation/vim-colors-solarized/blob/master/colors/solarized.vim
# SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      sRGB        HSB
# --------- ------- ---- -------  ----------- ---------- ----------- -----------
# base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
# base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
# base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
# base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
# base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
# base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
# base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
# base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
# yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
# orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
# red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
# magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
# violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
# blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
# cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
# green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
#
# Combinations: dark - base03:base0, light - base3:base00

download_nvim_plug() {
    curl -fsSL https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.config/nvim/autoload/plug.vim --create-dirs
}


# Works for bash and zsh
# TODO the extension would be saved as .bash in either case
download_git_completion() {
    curl -fsSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.local/git/git-completion.bash
}


# TODO what about zsh?
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


# This is the one I'm using atm
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
#
# https://github.com/charmbracelet/glow
#
# https://github.com/keycastr/keycastr
install_brew_requirements() {
    # https://ohmyposh.dev/docs/macos
    #gnupg aka gnupg2

    # TODO finish the extensive list
    local reqs='
    fd
    fzf
    karabiner-elements
    lua
    lua-language-server
    luarocks
    iterm2
    jandedobbeleer/oh-my-posh/oh-my-posh
    jq
    neovim
    pnpm
    ripgrep
    stow
    tmux
    watchman
    '
    brew install $reqs

    local cask_reqs='
    karabiner-elements
    keycastr
    '
    brew install --cask $cask_reqs
}

