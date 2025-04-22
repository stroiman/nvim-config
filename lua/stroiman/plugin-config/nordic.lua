local setup_nordic = function()
  -- require("nordic").load()
  -- require("nordic").setup({
  --   bold_keywords = true,
  --   italic_comments = true,
  --   -- FooBar
  --   telescope = {
  --     -- Available styles: `classic`, `flat`.
  --     style = "classic",
  --   },
  -- })
  --
  vim.g.stroiman_nordic_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "nordic" then
      setup_nordic()
    end
  end,
})

if vim.g.stroiman_nordic_setup then
  setup_nordic()
end
