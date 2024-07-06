local setup_gitsigns = function()
  require("gitsigns").setup()

  vim.g.stroiman_gitsigns_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "gitsigns" then
      setup_gitsigns()
    end
  end,
})

if vim.g.stroiman_gitsigns_setup then
  setup_gitsigns()
end
