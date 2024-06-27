return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    name = "lsp-config",
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
