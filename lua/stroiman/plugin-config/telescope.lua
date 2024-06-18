function make_builtin(name) 
  return function()
    require("telescope.builtin")[name]()
  end
end

vim.keymap.set('n', '<leader>ff', make_builtin("find_files"), {})
vim.keymap.set('n', '<leader>fg', make_builtin("live_grep"), {})
vim.keymap.set('n', '<leader>fb', make_builtin("buffers"), {})
vim.keymap.set('n', '<leader>fh', make_builtin("help_tags"), {})