local setup_which_key = function()
  vim.g.stroiman_which_key_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "which-key" then
      setup_which_key()
    end
  end,
})

if vim.g.stroiman_which_key_setup then
  setup_which_key()
end
