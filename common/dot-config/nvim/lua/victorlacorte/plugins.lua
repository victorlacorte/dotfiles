local status, packer = pcall(require, 'packer')

if not status then
    return
end

-- use('mfussenegger/nvim-dap')
--
-- use('williamboman/mason.nvim')
--
-- TODO whenever I feel like using more tabs in the workflow
--use('akinsho/bufferline.nvim')
--
-- LSP UIs
--use( 'glepnir/lspsaga.nvim'
packer.startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- colorscheme
    --use('ellisonleao/gruvbox.nvim')
    --use('Mofiqul/vscode.nvim')
    --use('folke/tokyonight.nvim')
    use('marko-cerovac/material.nvim')

    -- color string highlighter
    use('norcalli/nvim-colorizer.lua')

    -- File icons
    use('kyazdani42/nvim-web-devicons')

    -- statusline
    use('nvim-lualine/lualine.nvim')

    -- undo history visualizer
    use('mbbill/undotree')

    -- autopair plugin
    use('windwp/nvim-autopairs')

    -- TODO this needs more exploration
    -- git decorations
    use('lewis6991/gitsigns.nvim')

    -- tpope Git plugins
    use('tpope/vim-fugitive')
    use('tpope/vim-rhubarb')

    -- use treesitter to autoclose and autorename html tag
    use('windwp/nvim-ts-autotag')

    -- LSP
    use('neovim/nvim-lspconfig')

    -- Language parsing
    use({
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    })

    use('nvim-treesitter/playground')

    -- Fuzzy finder over lists
    use({
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    })

    -- C port of fzf
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

    use('nvim-telescope/telescope-file-browser.nvim')

    -- Use Neovim as a language server to inject LSP diagnostics, code actions,
    -- and more via Lua
    use({
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    })

    -- nvim-cmp source for neovim's built-in language server client
    use('hrsh7th/cmp-nvim-lsp')
    -- nvim-cmp source for buffer words
    use('hrsh7th/cmp-buffer')
    -- nvim-cmp source for filesystem paths
    use('hrsh7th/cmp-path')
    -- nvim-cmp source for vim's cmdline
    use('hrsh7th/cmp-cmdline')
    -- completion engine plugin
    use('hrsh7th/nvim-cmp')

    use('hrsh7th/cmp-emoji')

    -- Snippet engine
    use('L3MON4D3/LuaSnip')
    -- luasnip completion source for nvim-cmp
    use('saadparwaiz1/cmp_luasnip')

    -- Vscode-like pictograms
    use('onsails/lspkind.nvim')

    -- TODO flutter testing
    --use({
    --    'akinsho/flutter-tools.nvim',
    --    requires = { 'nvim-lua/plenary.nvim' }
    --})

    use('rafamadriz/friendly-snippets')
end)
