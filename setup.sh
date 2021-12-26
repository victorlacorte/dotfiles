#!/bin/bash

set -euo pipefail

# https://ohmyposh.dev/docs/linux
function setupOhMyPosh() {
  local exec="$HOME/bin/oh-my-posh"
  # local themes="$HOME/.local/oh-my-posh/themes"

  mkdir -p "$HOME/bin"
  # mkdir -p "$themes"

  curl -fsSL https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -o "$exec"
  sudo chmod +x "$exec"

  # curl -fsSL https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -o "$themes/themes.zip"
  # unzip "$themes/themes.zip"
  # rm "$themes/themes.zip"
  # chmod u+rw "$themes/*.json"
}

# https://github.com/microsoft/cascadia-code/releases/latest
function downloadCascadiaCode() {
  mkdir -p "$HOME/Downloads"

  curl -fsSL https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip -o "$HOME/Downloads/CascadiaCode.zip"
}

# stow needs to be on the latest version (e.g. with support for --dotfiles
# flag) in order for this script to work
function requirements() {
  local has_error=0

  for program in curl stow; do
    if ! command -v "$program" > /dev/null; then
      has_error=1
      echo "$program needs to be installed"
    fi
  done

  if [ "$has_error" -ne 0 ]; then
    exit 1
  fi
}

# APT specific; be careful not to generalize to Arch installations
function install() {
  sudo apt-get install \
    bash-completion \
    git git-doc \
    man-db \
    stow \
    tmux \
    vim-gtk
}

# TODO Docker setup, GnuPG + SSH authentication, Cascadia Code

