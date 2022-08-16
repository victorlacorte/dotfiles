local status, packer = pcall(require, 'packer')

if not status then
    return
end

-- use( 'mfussenegger/nvim-dap'
--
-- use( 'williamboman/mason.nvim'
--
-- use( 'rafamadriz/friendly-snippets'
packer.startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- colorscheme
    use('ellisonleao/gruvbox.nvim')

    -- color string highlighter
    use('norcalli/nvim-colorizer.lua')

    -- File icons
    use('kyazdani42/nvim-web-devicons')

    -- statusline
    use('nvim-lualine/lualine.nvim')

    -- TODO whenever I feel like using more tabs in the workflow
    --use('akinsho/bufferline.nvim')

    -- undo history visualizer
    use('mbbill/undotree')

    -- autopair plugin
    use('windwp/nvim-autopairs')

    -- git decorations
    use('lewis6991/gitsigns.nvim')

    -- use treesitter to autoclose and autorename html tag
    use('windwp/nvim-ts-autotag')

    -- LSP
    use('neovim/nvim-lspconfig')

    -- TODO if there are folding issues,
    -- after/plugin/folding.vim
    --set foldmethod=expr
    --set foldexpr=nvim_treesitter#foldexpr()
    -- Language parsing
    use({
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    })

    -- Fuzzy finder over lists
    use({
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    })

    -- C port of fzf
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

    -- Use Neovim as a language server to inject LSP diagnostics, code actions,
    -- and more via Lua
    use({
        'jose-elias-alvarez/null-ls.nvim',
        --config = function()
        --    require('null-ls').setup()
        --end,
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

    -- Snippet engine
    use('L3MON4D3/LuaSnip')
    -- luasnip completion source for nvim-cmp
    use('saadparwaiz1/cmp_luasnip')

    -- Vscode-like pictograms
    use('onsails/lspkind.nvim')

    -- TODO start here
    ---- nvim-cmp source for neovim's built-in LSP
    --use( 'hrsh7th/cmp-nvim-lsp'

    ---- Completion engine
    --use( 'hrsh7th/nvim-cmp'

    ---- nvim-cmp source for buffer words
    --use( 'hrsh7th/cmp-buffer'


    ---- Snippet engine
    --use( 'L3MON4D3/LuaSnip'

    --use( "mbbill/undotree"


    -- LSP UIs
    --use( 'glepnir/lspsaga.nvim'


    --use( {
    --	"windwp/nvim-autopairs",
    --    config = function() require("nvim-autopairs").setup {} end
    --}

    --use( 'windwp/nvim-ts-autotag'

end)
