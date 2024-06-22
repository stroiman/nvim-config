return {
  { "williamboman/mason.nvim", name = "mason" },
  { "williamboman/mason-lspconfig.nvim", name ="mason-lspconfig" },
  {
    "neovim/nvim-lspconfig",
    name="lsp-config",
    requires = { 
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
  }
}
