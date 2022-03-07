local actions = require('telescope.actions')

require('telescope').load_extension('fzf')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close
            },
        },
    },
    -- pickers = {
    --     find_files = {
    --         mappings = {
    --             n = {
    --                 ['<C-p>'] = function()
    --                     require('telescope.builtin').find_files()
    --                 end
    --             }
    --         }
    --     }
    -- }
}

-- require('telescope.builtin').find_files({
--     prompt_title = prompt,
--     cwd = cwd,
-- 
--     attach_mappings = function(prompt_bufnr, map)
--         select_background(prompt_bufnr, map)
-- 
--         -- Please continue mapping (attaching additional key maps):
--         -- Ctrl+n/p to move up and down the list.
--         return true
--     end,
-- })
--
-- vim.api.nvim_set_keymap('n', '<C-p>',  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true })

