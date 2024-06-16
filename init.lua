function Reload() 
	dofile(vim.env.MYVIMRC)
	vim.notify("Configuration reloaded!", vim.log.levels.INFO)
end

vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>vs", Reload)
vim.keymap.set("n", "<leader>ve", ":tabnew +tcd\\ %:p:h $MYVIMRC<cr>")
vim.keymap.set("n", "<C-s>", ":w<cr>")


