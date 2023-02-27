require('packer').startup(function(use)
	use('wbthomason/packer.nvim')
    use('tpope/vim-unimpaired')
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
	use('rose-pine/neovim')
	use('ellisonleao/gruvbox.nvim')
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

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- use 'mhinz/vim-startify'

  use 'nkrkv/nvim-treesitter-rescript'
  use 'pacha/vem-tabline'
end)
