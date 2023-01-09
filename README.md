# dotfiles

## MacBook

- [Trackpad gestures](https://support.apple.com/en-us/HT204895)

- Document MacBook configuration

  - [xcode-select active developer directory error](https://stackoverflow.com/a/17980786)

- Repeating characters: `defaults write -g ApplePressAndHoldEnabled -bool false`

- Switch keyboard layouts: ctrl + `<Tab>`

- [Copy and paste from the terminal](https://apple.stackexchange.com/a/15322):
  `pbcopy and pbpaste`

- Clocker app for improved timezone viewing

- GnuPG issues:
  - [Brew formula](https://formulae.brew.sh/formula/pinentry-mac)
  - [SO discussion](https://stackoverflow.com/a/40066889/1643883)

### Battery

Put hard disks to sleep when possible: Only on Battery

Wake for network access: Only on Power Adapter

Optimize video streaming while on battery: True

### iterm2

Profiles > Colors > toggle on "Smart box cursor color"

### Karabiner Elements

- [Mouse events are not enabled by default](https://karabiner-elements.pqrs.org/docs/help/how-to/mouse-button/):
  `Devices -> check Mouse events`

#### Apple internal keyboard

- Remap `fn` to `left_control`

#### All devices

- Remap `caps_lock` to `escape`

## What is missing

### Tmux

- Perform `clear` after detaching
- When killing the last pane in a session, switch to the previous session
- Auto-name new sessions to their index
- When creating a new window, do it from the current path

### Telescope

- Go to definition on a new file
- Refactor files -> tpope/vim-eunuch
- `<Leader>ps`: should also have the option to send results to a QuickList

### Netrw

- Delete whole (non-empty) directories

### Vinegar?

### IdeaVim

### Neogit

### LSP

#### Hover

- `vim.lsp.buf.hover()`: Displays hover information about the symbol under the
  cursor in a floating window. Calling the function twice will jump into the
  floating window.

  - TODO How to indicate there are more docs to be shown?

#### Check out

- [Kickstart](https://github.com/nvim-lua/kickstart.nvim)
- [Reddit: Nvim suggestions for Python development](https://www.reddit.com/r/neovim/comments/pgiobu/neovim_setup_suggestions_for_python_development/)
- [Nvim for beginners: refactoring'](https://alpha2phi.medium.com/neovim-for-beginners-refactoring-4f517d12a43f)
- [nvim-lspconfig: pylsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp)

### Colorschemes

- [One Dark](https://github.com/joshdick/onedark.vim)
- [One Dark Nvim](https://github.com/navarasu/onedark.nvim)
- [Tokyo Night](https://github.com/folke/tokyonight.nvim)
- [Solarized](https://github.com/shaunsingh/solarized.nvim)
- [Solarized colors](https://github.com/altercation/vim-colors-solarized)
- [Solarized Nvim](https://github.com/svrana/neosolarized.nvim)
- [Color buddy](https://github.com/tjdevries/colorbuddy.nvim)
- [Material](https://github.com/marko-cerovac/material.nvim)
- [Nebulous](https://github.com/Yagua/nebulous.nvim)
- [Material theme](https://material-theme.site)
- [Coolors](https://coolors.co/palettes/popular)
- [iTerm2 Material Design](https://github.com/MartinSeeler/iterm2-material-design)

## TODO

- match jsx/tsx component bracket
