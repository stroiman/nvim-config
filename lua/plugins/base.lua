return {
  "tpope/vim-fugitive",
  "christoomey/vim-tmux-navigator",
  "mbbill/undotree",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme "gruvbox"
    end
  },
  "kyazdani42/nvim-web-devicons"
}
