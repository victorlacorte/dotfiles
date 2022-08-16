local status, autopairs = pcall(require, 'nvim-autopairs')

if not status then
    return
end

autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' },
        java = false,
    },
    disable_filetype = { 'TelescopePrompt', 'vim' },
})


local cmp_status, cmp = pcall(require, 'cmp')

if not cmp_status or cmp == nil then
    return
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
