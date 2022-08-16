local function bind(op)
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend('force',
            { noremap = true },
            opts or {}
        )

        vim.keymap.set(op, lhs, rhs, opts)
    end
end

local n = bind('n')

-- Default overrides
-- Don't yank with x
n('x', '"_x')

-- Convenience
n('<Leader>pv', ':Ex<CR>')
n('<Leader>u', ':UndotreeToggle<CR>')

-- Jump to the previous buffer location
--n('<Leader>jp', '<C-^>')

n('<Leader>te', ':tabedit')
n('<Leader>tn', ':tabnext<CR>')
n('<Leader>tp', ':tabprevious<CR>')

-- Split window
n('<Leader>ss', ':split<Return><C-w>w')
n('<Leader>sv', ':vsplit<Return><C-w>w')

-- Resize with arrows
--n('<C-w><Up>', ':resize +2<CR>')
--n('<C-w><Down>', ':resize -2<CR>')
--n('<C-w><Left>', ':vertical resize -2<CR>')
--n('<C-w><Right>', ':vertical resize +2<CR>')

-- Telescope
n('<C-p>', "<Cmd>lua require('telescope.builtin').find_files({ previewer = false, shorten_path = true })<CR>")
n('<Leader>ps', '<Cmd>Telescope live_grep<CR>')
n('<Leader>vb', '<Cmd>Telescope buffers<CR>')
--n('<Leader>fh', '<Cmd>Telescope help_tags<CR>')
n('<Leader>vd', '<Cmd>Telescope diagnostics<CR>')

-- LSP
n('[d', ':lua vim.diagnostic.goto_prev()<CR>')
n(']d', ':lua vim.diagnostic.goto_next()<CR>')
