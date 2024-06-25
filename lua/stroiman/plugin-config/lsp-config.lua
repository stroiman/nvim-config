local setup_lspconfig = function()
  require("mason").setup({
  })
  require("mason-lspconfig").setup({
    automatic_installation = true,
  })
  local lspconfig = require("lspconfig");
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local lsp_default_capabilities = require('cmp_nvim_lsp').default_capabilities()

  capabilities = vim.tbl_deep_extend('force', capabilities, lsp_default_capabilities)
  lspconfig.tsserver.setup({ capabilities })
  lspconfig.lua_ls.setup({ capabilities })
  lspconfig.ocamllsp.setup({ capabilities })
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
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
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󱈸', -- '',
      [vim.diagnostic.severity.WARN] = '', -- '', -- '',
      [vim.diagnostic.severity.INFO] = '', -- '', -- '', -- '',
      [vim.diagnostic.severity.HINT] = '', -- '' --''
    }
  },
  float = { border = "rounded" },
  underline = { min = vim.diagnostic.severity.ERROR }

})
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.cmd [[
augroup stroiman_lsp_config
  au!
  autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
  autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  autocmd BufWritePre *.js,*.ts lua vim.lsp.buf.format()
  autocmd BufWritePre *.lua lua vim.lsp.buf.format()
augroup end
]]

local border = "rounded"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border })
