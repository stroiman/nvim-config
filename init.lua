-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require("stroiman")

vim.keymap.set('n', '<leader>ve', ':e $HOME/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>vs', ':so $HOME/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>vp', ':PackerSync<cr>')
