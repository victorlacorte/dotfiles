local status, material = pcall(require, 'material')

if not status then
    return
end

local status_colors, colors = pcall(require, 'material.colors')

if status_colors then
    material.setup({
        custom_highlights = {
            ColorColumn = { bg = colors.active }
        },
        plugins = {
            -- Available plugins:
            -- "dap",
            -- "dashboard",
            'gitsigns',
            -- "hop",
            -- "indent-blankline",
            -- "lspsaga",
            -- "mini",
            -- "neogit",
            'nvim-cmp',
            -- "nvim-navic",
            -- "nvim-tree",
            'nvim-web-devicons',
            -- "sneak",
            'telescope',
            -- "trouble",
            -- "which-key",
        }
    })
end

vim.g.material_style = 'darker'
vim.cmd.colorscheme('material')

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
