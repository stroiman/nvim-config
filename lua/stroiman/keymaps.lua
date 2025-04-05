-- unmap <C-a> & <C-x> - increment/decrement .
-- Particularly <C-a> interferes with my tmux config (common to use C-a)
vim.keymap.set("n", "<C-a>", "<nop>")
vim.keymap.set("n", "<C-x>", "<nop>")
vim.keymap.set("n", "<leader>vmm", ":messages<cr>")
vim.keymap.set("n", "<leader>vmc", ":messages clear<cr>")
vim.keymap.set("n", "-", [[:Ex <bar> :silent! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
-- Open current folder in a split, but I never use it.
vim.keymap.set("n", "<leader>-h", [[:30Lex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-l", [[:30Lex! <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-j", [[:40Hex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-k", [[:40Hex! <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
-- vim.keymap.set("n", "[q", [[:silent! cprev<CR>]], { silent = true })
-- vim.keymap.set("n", "]q", [[:silent! cnext<CR>]], { silent = true })
vim.keymap.set("n", "Q", "gqip")
vim.keymap.set("n", "<leader>dcu", ":!docker compose up -d<CR>", { desc = "Up" })
vim.keymap.set("n", "<leader>es", function()
  require("luasnip.loaders").edit_snippet_files({})
end)

-- Up/down behaviour
vim.keymap.set({ "n", "v" }, "j", [[(v:count > 1 ? "m'" . v:count . 'j' : 'gj')]], { expr = true })
vim.keymap.set({ "n", "v" }, "k", [[(v:count > 1 ? "m'" . v:count . 'k' : 'gk')]], { expr = true })

-- Don't replace yank buffer when pasting in visual mode
vim.keymap.set("v", "p", "P")
vim.keymap.set("v", "P", "p")

vim.keymap.set("n", "<leader>wj", [[5<C-w>-]])
vim.keymap.set("n", "<leader>wk", [[5<C-w>+]])
vim.keymap.set("n", "<leader>wh", [[5<C-w><]])
vim.keymap.set("n", "<leader>wl", [[5<C-w>>]])

-- Obsidian

vim.keymap.set("n", "<leader>ww", ":ObsidianToday<cr>")
