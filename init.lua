function Reload()
  for name, _ in pairs(package.loaded) do
    if name:match("^stroiman") and not name:match("nvim-tree") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

vim.g.mapleader = " "
require("stroiman.init")

vim.notify("Path: " .. vim.fn.stdpath("data"))

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.keymap.set(
  "n",
  "<leader>ve",
  ":tabnew +tcd\\ %:p:h $HOME/.config/nvim/init.lua<cr>"
)
vim.keymap.set("n", "<leader>vs", Reload)
vim.keymap.set("n", "<leader>vp", ":PackerSync<cr>")
vim.keymap.set(
  "n",
  "<leader><leader>e",
  ":tabnew ~/.config/nvim/lua/stroiman/luasnip-config.lua<CR>"
)
vim.keymap.set(
  "n",
  "<leader><leader>s",
  "<cmd>source ~/.config/nvim/lua/stroiman/luasnip-config.lua<CR>"
)
