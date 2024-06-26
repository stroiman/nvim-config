local setup_telescope = function()
  require("telescope").setup()


  vim.g.stroiman_telescope_setup = true;
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "telescope" then
      setup_telescope()
    end
  end
})

if vim.g.stroiman_telescope_setup then
  setup_telescope()
end
local function make_builtin(name)
  return function()
    require("telescope.builtin")[name]()
  end
end

vim.keymap.set('n', '<leader>ff', make_builtin("find_files"), {})
vim.keymap.set('n', '<leader>fg', make_builtin("live_grep"), {})
vim.keymap.set('n', '<leader>fb', make_builtin("buffers"), {})
vim.keymap.set('n', '<leader>fh', make_builtin("help_tags"), {})
vim.keymap.set('n', '<leader>ft', make_builtin("builtin"), {})
vim.keymap.set('n', '<leader>fd', make_builtin("lsp_definitions"), {})
vim.keymap.set('n', '<leader>fr', make_builtin("lsp_references"), {})
