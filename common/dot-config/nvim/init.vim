call plug#begin('~/.config/nvim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Telescope
" TODO folding issues with Telescope:
" https://github.com/nvim-treesitter/nvim-treesitter/issues/1337
" https://github.com/nvim-telescope/telescope.nvim/issues/699
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Colorscheme
"Plug 'tomasiser/vim-code-dark'
Plug 'gruvbox-community/gruvbox'

" Powerline
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" null-ls
Plug 'jose-elias-alvarez/null-ls.nvim'

" undodir
Plug 'mbbill/undotree'

" Experimental
" Netrw
"Plug 'tpope/vim-vinegar'

"Plug 'vim-utils/vim-man'

call plug#end()

" Setup undodir
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

lua require('setup')

set number
set incsearch
set nowrap
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nobackup
set noerrorbells
set scrolloff=8
set relativenumber
set cursorline
set cursorlineopt=number
set clipboard+=unnamedplus

"colorscheme codedark
colorscheme  gruvbox
highlight ColorColumn ctermbg=darkred
call matchadd('ColorColumn', '\%80v')

let mapleader=" "

" Netrw
let g:netrw_browse_split=0
let g:netrw_banner=0
let g:netrw_winsize=25

" setting clipboard+=unnamedplus makes these unnecessary
"nnoremap <Leader>y "+y
"nnoremap <Leader>p "+p
"nnoremap <Leader>Y "*y
"nnoremap <Leader>P "*d
"nnoremap <Leader>y :!pbcopy<CR>
"nnoremap <Leader>p :!pbpaste<CR>

" Source Nvim's config (i.e. this) file
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Jump to the previous buffer location
nnoremap <Leader>jp <C-^>

" Telescope
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<CR>
nnoremap <Leader>vb :lua require('telescope.builtin').buffers()<CR>

" Netrw
nnoremap <Leader>pv :Ex<CR>

" LSP
nnoremap <Leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <Leader>h :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>rn :lua vim.lsp.buf.rename()<CR>

" Diagnostic
nnoremap <Leader>vd :lua vim.diagnostic.open_float()<CR>
nnoremap <Leader>vr :lua vim.diagnostic.setloclist()<CR>
nnoremap [d :lua vim.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.diagnostic.goto_next()<CR>

" Undotree
nnoremap <Leader>u :UndotreeToggle<CR>
