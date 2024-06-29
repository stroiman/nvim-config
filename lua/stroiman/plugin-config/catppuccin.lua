local setup_catppuccin = function()
  print("FOOBAR")
  local catppuccin = require("catppuccin")
  catppuccin.setup({
    transparent_background = true,
  })

  vim.cmd.colorscheme("catppuccin")

  vim.g.stroiman_catppuccin_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "catppuccin" then
      setup_catppuccin()
    end
  end,
})

if vim.g.stroiman_catppuccin_setup then
  setup_catppuccin()
end
