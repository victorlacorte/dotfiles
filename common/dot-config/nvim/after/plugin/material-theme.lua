local status, material = pcall(require, 'material')

if not status then
    return
end

local status_colors, colors = pcall(require, 'material.colors')

if status_colors then
    material.setup({
        custom_highlights = {
            ColorColumn = { bg = colors.darkred }
        }
    })
end

vim.g.material_style = 'darker'
vim.cmd('colorscheme material')
