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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Git
Plug 'tpope/vim-fugitive'

" Colorscheme
Plug 'tomasiser/vim-code-dark'

"Plug 'vim-utils/vim-man'
"Plug 'mbbill/undotree'

call plug#end()

"autocmd InsertEnter * :set relativenumber
"autocmd InsertLeave * :set relativenumber
"autocmd FocusGained * :set relativenumber
"autocmd FocusLost * :set norelativenumber

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
set clipboard+=unnamedplus

colorscheme codedark
highlight ColorColumn ctermbg=darkred
call matchadd('ColorColumn', '\%80v')

let mapleader=" "

" Netrw
let g:netrw_browse_split=0
let g:netrw_banner=0
let g:netrw_winsize=25

"nnoremap <Leader>y "+y
"nnoremap <Leader>p "+p
"nnoremap <Leader>Y "*y
"nn"noremap <Leader>P "*d

"nnoremap <Leader>y :!pbcopy<CR>
"nnoremap <Leader>p :!pbpaste<CR>

" Source Nvim's config file
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Jump to the previous buffer location
nnoremap <Leader>jp <C-^>

" Telescope
"nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" Netrw
nnoremap <Leader>pv :Ex<CR>
nnoremap <Leader>vp :Rex<CR>

" LSP
nnoremap <Leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>h :lua vim.lsp.buf.hover()<CR>
" Implementation = specific
nnoremap <Leader>gi :lua vim.lsp.buf.implementation()<CR>
" Reference = general, matches the same name
nnoremap <Leader>gr :lua vim.lsp.buf.references()<CR>
"nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <Leader>vrn :lua vim.lsp.buf.rename()<CR>
" nnoremap <Leader>vca :lua vim.lsp.buf.code_action()<CR>
"nnoremap <Leader>vd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

" Deprecated
" nnoremap <Leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
"
" Not supported by the Typescript LSP
" nnoremap gD :lua vim.lsp.buf.declaration()<CR>


"set completeopt=menu,menuone,noselect
