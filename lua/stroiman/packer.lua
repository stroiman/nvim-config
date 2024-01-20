-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
  au!
  au BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("tpope/vim-unimpaired")
  use("christoomey/vim-tmux-navigator")
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-telescope/telescope-ui-select.nvim" })
  -- use('nvim-telescope/telescope-project.nvim')
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({})
    end,
  })
  use("vim-scripts/vimwiki")
  use("mattn/calendar-vim")

  use("rose-pine/neovim")
  use("ellisonleao/gruvbox.nvim")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use("bluz71/vim-nightfly-guicolors")

  use("kyazdani42/nvim-web-devicons")

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  -- use('nvim-treesitter/playground')
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")

  -- LSP and completion
  use({
    "wbthomason/packer.nvim",
    config = function()
      require("mason").setup()
    end,
  })
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use("neovim/nvim-lspconfig")
  use("nvimtools/none-ls.nvim")

  -- Navigation
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  })

  -- Git stuff
  use("tpope/vim-projectionist")
  use("tpope/vim-rhubarb")
  use("lewis6991/gitsigns.nvim")

  use("nvim-lualine/lualine.nvim")
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  -- use 'mhinz/vim-startify'

  -- use 'nkrkv/nvim-treesitter-rescript'
  use({
    "kevinhwang91/nvim-ufo",
    requires = {
      { "kevinhwang91/promise-async" },
    },
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "neovim/nvim-lspconfig",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- " For vsnip users.
      -- Plug 'hrsh7th/cmp-vsnip'
      -- Plug 'hrsh7th/vim-vsnip'
      --
      -- " For luasnip users.
      -- " Plug 'L3MON4D3/LuaSnip'
      -- " Plug 'saadparwaiz1/cmp_luasnip'
      --
      -- " For ultisnips users.
      -- " Plug 'SirVer/ultisnips'
      -- " Plug 'quangnguyen30192/cmp-nvim-ultisnips'
      --
      -- " For snippy users.
      -- " Plug 'dcampos/nvim-snippy'
      -- " Plug 'dcampos/cmp-snippy'}
      -- }
    },
  })
  -- Debugging
  use({
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
    },
  })
use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
  use({
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  })

  if is_bootstrap then
    require("packer").sync()
  end
end)
