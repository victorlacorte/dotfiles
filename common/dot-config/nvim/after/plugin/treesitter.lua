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
        'html',
        'javascript',
        'lua',
        'python',
        'swift',
        'tsx',
        'typescript',
        'vim',
    },
})
