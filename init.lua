vim.opt.expandtab=true
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.softtabstop=2

function Reload() 
  for name, _ in pairs(package.loaded) do
    if name:match("^stroiman") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Configuration reloaded", vim.log.levels.INFO)
end


vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>vs", Reload)
vim.keymap.set("n", "<leader>ve", ":tabnew +tcd\\ %:p:h $MYVIMRC<cr>")
vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("i", "<C-s>", "<esc>:w<cr>")

require("stroiman")

