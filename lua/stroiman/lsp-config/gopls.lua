local M = {}

M.setup = function(config)
  local lspconfig = require("lspconfig")
  lspconfig.gopls.setup({
    capabilities = config.capabilities,
    settings = {
      gopls = {
        env = { GOEXPERIMENT = "synctest" },
      },
    },
  })
end

return M
