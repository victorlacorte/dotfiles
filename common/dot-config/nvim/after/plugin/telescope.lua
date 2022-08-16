local status, telescope = pcall(require, 'telescope')

if not status then
    return
end

local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        path_display = { 'truncate' },

        mappings = {
            i = {
                ['<Esc>'] = actions.close,
            },
        },
    },
    pickers = {
        find_files = {
            find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix', '--hidden', '--exclude', '.git' }
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case". the default case_mode is "smart_case"
        }
    },
}

telescope.load_extension('fzf')
