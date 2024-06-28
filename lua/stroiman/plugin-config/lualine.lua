local setup_lualine = function()
  require("lualine").setup({
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "tabs", "searchcount", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = { "fugitive", "quickfix" },
  })

  vim.g.stroiman_lualine_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "lualine" then
      setup_lualine()
    end
  end,
})

if vim.g.stroiman_lualine_setup then
  setup_lualine()
end
