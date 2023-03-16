-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
  augroup packer_user_config
    au!
    au BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, 'packer')
if not status then
    return
end

return packer.startup(function(use)
	use('wbthomason/packer.nvim')
    use('tpope/vim-unimpaired')
    use('christoomey/vim-tmux-navigator')
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    -- use('nvim-telescope/telescope-project.nvim')
    use{
        'ahmedkhalf/project.nvim',
        config = function()
            require("project_nvim").setup {
            }
        end
    }
    use('vim-scripts/vimwiki')
    use('mattn/calendar-vim')

	use('rose-pine/neovim')
	use('ellisonleao/gruvbox.nvim')
	use('bluz71/vim-nightfly-guicolors')

    use("kyazdani42/nvim-web-devicons")

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

  -- Git stuff
  use('tpope/vim-projectionist')
  use('tpope/vim-rhubarb')
  use('lewis6991/gitsigns.nvim')

  use('nvim-lualine/lualine.nvim')
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- use 'mhinz/vim-startify'

  use 'nkrkv/nvim-treesitter-rescript'

  if is_bootstrap then
      require("packer").sync()
  end
end)
