require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'rose-pine/neovim'
	use { "ellisonleao/gruvbox.nvim", config = function()
		vim.cmd('colorscheme gruvbox')
	end}

	use('nvim-tresitter/nvim-treesitter', { run = ':TSUpdate'})

end)
