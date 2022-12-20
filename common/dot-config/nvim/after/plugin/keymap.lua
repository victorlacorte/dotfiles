local builtin = require('telescope.builtin')

-- Falling back to find_files if git_files can't find a .git directory
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory
local function project_files()
    --local opts = { previewer = false, shorten_path = true }
    local opts = {}

    vim.fn.system('git rev-parse --is-inside-work-tree')

    if vim.v.shell_error == 0 then
        builtin.git_files(opts)
    else
        builtin.find_files(opts)
    end
end

local function project_search()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end

-- Default overrides
-- Don't yank with x
vim.keymap.set('n', 'x', '"_x')

-- Copying theprimeagen
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<Leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<Leader>d', [["_d]])

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', '<C-j>', '<Cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-k>', '<Cmd>cprev<CR>zz')

-- TODO don't know what these do
--vim.keymap.set('n', '<Leader>k', '<Cmd>lnext<CR>zz')
--vim.keymap.set('n', '<Leader>j', '<Cmd>lprev<CR>zz')

-- Convenience
--vim.keymap.set('n', '<Leader>pv', ':Ex<CR>')
vim.keymap.set('n', '<Leader>u', ':UndotreeToggle<CR>')

--vim.keymap.set('n', '<Leader>te', ':tabedit')
--vim.keymap.set('n', '<Leader>tn', ':tabnext<CR>')
--vim.keymap.set('n', '<Leader>tp', ':tabprevious<CR>')

-- Split window
vim.keymap.set('n', '<Leader>ss', ':split<Return><C-w>w')
vim.keymap.set('n', '<Leader>sv', ':vsplit<Return><C-w>w')

-- Resize with arrows
--vim.keymap.set('n', '<C-w><Up>', ':resize +2<CR>')
--vim.keymap.set('n', '<C-w><Down>', ':resize -2<CR>')
--vim.keymap.set('n', '<C-w><Left>', ':vertical resize -2<CR>')
--vim.keymap.set('n', '<C-w><Right>', ':vertical resize +2<CR>')

-- Telescope
vim.keymap.set('n', '<C-p>', project_files)
vim.keymap.set('n', '<Leader>ps', project_search)
vim.keymap.set('n', '<Leader>vb', builtin.buffers)
vim.keymap.set('n', '<Leader>vd', builtin.diagnostics)
vim.keymap.set('n', '<Leader>pv', ':Telescope file_browser path=%:p:h<CR>')

-- Fugitive
vim.keymap.set('n', '<Leader>gs', vim.cmd.Git)
