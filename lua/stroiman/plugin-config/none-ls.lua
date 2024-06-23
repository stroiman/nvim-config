local setup_none_ls = function()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.completion.spell,
      require("none-ls.diagnostics.eslint_d"),
    },
  })
  vim.g.stroiman_none_ls_loaded = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "none-ls" then
      setup_none_ls()
    end
  end,
})

if vim.g.stroiman_none_ls_loaded then
  setup_none_ls()
end
