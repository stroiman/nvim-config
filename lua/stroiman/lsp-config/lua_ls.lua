-- local lspconfig = require("lspconfig")
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local lsp_default_capabilities = require("cmp_nvim_lsp").default_capabilities()

local M = {}

M.setup = function(config)
  local lspconfig = require("lspconfig")
  lspconfig.lua_ls.setup({
    capabilities = config.capabilities,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        hint = { enable = true },
        workspace = {
          checkThirdParty = false,
          library = {
            "${3rd}/luv/library",
            ---@diagnostic disable-next-line: deprecated
            unpack(vim.api.nvim_get_runtime_file("", true)),
          },
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  })
end

return M
