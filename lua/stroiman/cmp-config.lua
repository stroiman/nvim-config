local lspOk, lsp = pcall(require, "lsp-zero")
local cmpOk, cmp = pcall(require, "cmp")

if lspOk and cmpOk then
  -- local cmp_select = {behavior = cmp.SelectBehavior.Select}
  local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.config.disable,

    -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<C-n>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<tab>'] = cmp.mapping.confirm({ select = true }),
    -- ['<C-Space>'] = cmp.mapping.complete(),
  })

  cmp.setup({
    mapping = cmp_mappings,
  })
end
