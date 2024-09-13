local setup_comment_nvim = function()
  require("Comment").setup()

  vim.g.stroiman_comment_nvim_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "comment" then
      setup_comment_nvim()
    end
  end,
})

if vim.g.stroiman_comment_nvim_setup then
  setup_comment_nvim()
end
