local status_configs, configs = pcall(require, 'nvim-treesitter.configs')

if not status_configs then
    return
end

configs.setup({
    autotag = {
        enable = true,
    },
    -- :TSInstallInfo command to view supported languages
    ensure_installed = {
        'bash',
        'comment',
        'css',
        'dart',
        'gitignore',
        'html',
        'javascript',
        'jsdoc',
        'lua',
        'markdown',
        'python',
        'rust',
        'scheme',
        'swift',
        'tsx',
        'typescript',
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
    sync_install = false,
})
