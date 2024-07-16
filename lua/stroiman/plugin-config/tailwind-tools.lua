local setup_tailwind_tools = function()
  require("tailwind-tools").setup({
    -- your configuration
  })

  vim.g.stroiman_tailwind_tools_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "tailwind-tools" then
      setup_tailwind_tools()
    end
  end,
})

if vim.g.stroiman_tailwind_tools_setup then
  setup_tailwind_tools()
end
