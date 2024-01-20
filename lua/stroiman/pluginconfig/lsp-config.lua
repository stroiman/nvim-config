local ok, lsp = pcall(require,"lspconfig")
if ok then
  lsp.lua_ls.setup({})

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
end
