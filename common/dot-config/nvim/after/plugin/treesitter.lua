local status_configs, configs = pcall(require, 'nvim-treesitter.configs')

if not status_configs then
    return
end

configs.setup({
    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- :TSInstallInfo command to view supported languages
    ensure_installed = {
        'css',
        'dart',
        'gitignore',
        'html',
        'jsdoc',
        'lua',
        'python',
        'swift',
        --'javascript',
        --'typescript',
        'tsx',
        'vim',
        'yaml',
    },
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    autotag = {
        enable = true,
    },
})


local status_parsers, parsers = pcall(require, 'nvim-treesitter.parsers')

if not status_parsers then
    return
end

local parser_config = parsers.get_parser_configs()
parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
