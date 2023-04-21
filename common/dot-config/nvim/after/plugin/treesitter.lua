local status_configs, configs = pcall(require, 'nvim-treesitter.configs')

if not status_configs then
    return
end

configs.setup({
    -- :TSInstallInfo command to view supported languages
    ensure_installed = {
        'bash',
        'c',
        'c_sharp',
        'comment',
        'css',
        'dart',
        'dockerfile',
        'gitignore',
        'help',
        'html',
        'javascript',
        'jq',
        'jsdoc',
        'lua',
        'markdown',
        'python',
        'rust',
        'scheme',
        'swift',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'yaml',
    },
    sync_install = false,
    auto_install = true,
    autotag = {
        enable = true,
    },
    highlight = {
        enable = true,
        -- disable = {},
        additional_vim_regex_highlighting = false
    },
    --indent = {
    --    enable = true,
    --    disable = {},
    --},
})
