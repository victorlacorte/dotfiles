local lspconfig_status, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_status then
    return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local function on_attach(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', '<Leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<Leader>h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<Leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

    if client.name == 'tsserver' then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        return
    end

    if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.formatting_sync()
            end,
        })
    end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- npm install -g pyright
lspconfig.pyright.setup({})

-- brew install lua-language-server
lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/docs/format_config_EN.md
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = 'space',
                    quote_style = 'single'
                }
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

local null_ls_status, null_ls = pcall(require, 'null-ls')

if not null_ls_status then
    print('no null-ls!')
    return
end

local formatting = null_ls.builtins.formatting
--local diagnostics = null_ls.builtins.diagnostics
--local completion = null_ls.builtins.completion
--local codeactions = null_ls.builtins.code_actions

null_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    sources = {
        formatting.prettierd.with({
            disabled_filetypes = { 'yaml' },
            prefer_local = 'node_modules/.bin',
        }),

        -- python3 -m pip install git+https://github.com/psf/black
        formatting.black,
    },
})
