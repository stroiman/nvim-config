require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use('rose-pine/neovim')
	use('ellisonleao/gruvbox.nvim')
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
end)
