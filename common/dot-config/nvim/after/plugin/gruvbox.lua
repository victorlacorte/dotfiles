local status, gruvbox = pcall(require, 'gruvbox')

if not status then
    return
end

-- https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox/palette.lua
gruvbox.setup({
    overrides = {
        --ColorColumn = {bg = '#9d0006'}
        ColorColumn = { bg = '#cc241d' }

    },
})

-- https://github.com/ellisonleao/gruvbox.nvim#configuration
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')
