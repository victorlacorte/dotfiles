local cmp_status, cmp = pcall(require, 'cmp')
local snip_status, luasnip = pcall(require, 'luasnip')
local lspkind_status, lspkind = pcall(require, 'lspkind')

if not cmp_status or cmp == nil or not snip_status or not lspkind_status then
  return
end

require('luasnip/loaders/from_vscode').lazy_load()

local check_backspace = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    --['<C-k>'] = cmp.mapping.select_prev_item(),
    --['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm {
      -- behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    --['<Tab>'] = cmp.mapping(function(fallback)
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    --['<S-Tab>'] = cmp.mapping(function(fallback)
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  -- https://github.com/onsails/lspkind.nvim#option-2-nvim-cmp
  formatting = {
    format = lspkind.cmp_format({ mode = 'text_symbol', maxwidth = 50, preset = 'codicons' })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    --{ name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'emoji' },
  }),
  --confirm_opts = {
  --    behavior = cmp.ConfirmBehavior.Replace,
  --    select = false,
  --},
  window = {
    documentation = cmp.config.window.bordered(),
  },
  --experimental = {
  --    ghost_text = false,
  --    native_menu = false,
  --},
}
