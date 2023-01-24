local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load({ paths = '/Users/peter/.config/nvim/my_snippets' })
-- require("luasnip.loaders.from_snipmate").load({ paths = '/Users/peter/.config/nvim/my_snippets' })
-- require("luasnip.loaders.from_vscode").load()

vim.cmd('command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()')

vim.keymap.set('i', '<C-j>', function() luasnip.jump(1) end )
vim.keymap.set('i', '<C-h>', function() luasnip.jump(-1) end )

-- vim.keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice", {})
-- vim.keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice", {})
-- vim.keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
-- vim.keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
