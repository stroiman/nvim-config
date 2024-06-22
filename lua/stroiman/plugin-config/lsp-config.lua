function setup_lspconfig()
  print("Config")
  require("mason").setup({
  })
  require("mason-lspconfig").setup({
    automatic_installation = true,
  })
  local lspconfig = require("lspconfig");
  lspconfig.tsserver.setup({})
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev, opts)
    if ev.data == "lsp-config" then
      setup_lspconfig()
    end
  end
})

-- vim.keymap.set("n", "<leader>vm", setup_lspconfig)
vim.api.nvim_create_user_command("RestartLspConfig", setup_lspconfig, {})

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  float = { border = "rounded" },
  underline = { min = vim.diagnostic.severity.ERROR }

})
