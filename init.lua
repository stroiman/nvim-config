-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^stroiman') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

require("stroiman.init")

vim.keymap.set('n', '<leader>ve', ':e $HOME/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>vs', '<cmd>lua ReloadConfig()<cr>')
vim.keymap.set('n', '<leader>vp', ':PackerSync<cr>')
