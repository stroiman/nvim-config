local setup_telescope = function()
  require("telescope").setup()

  vim.g.stroiman_telescope_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "telescope" then
      setup_telescope()
    end
  end,
})

if vim.g.stroiman_telescope_setup then
  setup_telescope()
end

local function make_builtin(name, opts)
  return function()
    require("telescope.builtin")[name](opts)
  end
end

vim.keymap.set(
  "n",
  "<leader>ff",
  make_builtin("find_files", { hidden = true, file_ignore_patterns = { "^.git/" } }),
  { desc = "[S]earch [F]iles" }
)
vim.keymap.set("n", "<leader>fg", make_builtin("live_grep"), { desc = "[S]earch [G]rep" })
vim.keymap.set("n", "<leader>fb", make_builtin("buffers"), { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<leader>fh", make_builtin("help_tags"), { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>ft", make_builtin("builtin"), { desc = "[S]earch [T]elescope command" })
vim.keymap.set("n", "<leader>fd", make_builtin("lsp_definitions"), { desc = "[S]earch [D]efinitions" })
vim.keymap.set("n", "<leader>fr", make_builtin("lsp_references"), { desc = "[S]earch [R]eferences" })
