local lsp = require('lsp-zero')
local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<tab>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.config.disable,
  ['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
  mapping = cmp_mappings
})
