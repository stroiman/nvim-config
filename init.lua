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

vim.keymap.set('n', '<leader>ve', ':tabnew $HOME/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>vs', '<cmd>lua ReloadConfig()<cr>')
vim.keymap.set('n', '<leader>vp', ':PackerSync<cr>')
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/stroiman/luasnip-config.lua<CR>")
