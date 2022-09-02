# dotfiles

## TODO MacBook

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

### Karabiner Elements

- [Mouse events are not enabled by default](https://karabiner-elements.pqrs.org/docs/help/how-to/mouse-button/): `Devices -> check Mouse events`

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

- `vim.lsp.buf.hover()`: Displays hover information about the
  symbol under the cursor in a floating window. Calling the
  function twice will jump into the floating window.

  - TODO How to indicate there are more docs to be shown?

#### Check out

- [Kickstart](https://github.com/nvim-lua/kickstart.nvim)
- [Reddit: Nvim suggestions for Python development](https://www.reddit.com/r/neovim/comments/pgiobu/neovim_setup_suggestions_for_python_development/)
- [Nvim for beginners: refactoring'](https://alpha2phi.medium.com/neovim-for-beginners-refactoring-4f517d12a43f)
- [nvim-lspconfig: pylsp](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp)
