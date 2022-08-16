local status, lualine = pcall(require, 'lualine')

if not status then
    return
end

lualine.setup({
    -- options = {
    --   icons_enabled = true,
    --   theme = 'auto',
    --   component_separators = { left = '?', right = '?'},
    --   section_separators = { left = '?', right = '?'},
    --   disabled_filetypes = {},
    --   always_divide_middle = true,
    --   globalstatus = false,
    -- },
    sections = {
        lualine_a = { 'mode' },
        -- lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        --lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_x = {},
        --lualine_y = {'progress'},
        lualine_y = {},
        --lualine_z = {'location'}
        lualine_z = {},
    },
    --inactive_sections = {
    --  lualine_a = {},
    --  lualine_b = {},
    --  lualine_c = {'filename'},
    --  lualine_x = {'location'},
    --  lualine_y = {},
    --  lualine_z = {}
    --},
    -- tabline = {},
    -- extensions = {}
})
