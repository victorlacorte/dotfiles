local status, configs = pcall(require, 'nvim-treesitter.configs')

if not status then
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
        'javascript',
        'jsdoc',
        'lua',
        'python',
        'swift',
        'tsx',
        'typescript',
        'vim',
        'yaml',
    },
})
