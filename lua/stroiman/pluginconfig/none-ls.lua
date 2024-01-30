local ok, null_ls = pcall(require,"null-ls")
if ok then
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.diagnostics.eslint_d,
    },
  })

  vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
end
