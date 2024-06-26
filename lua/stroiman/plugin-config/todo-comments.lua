local setup_todo_comments = function()
  require("todo-comments").setup({})

  vim.g.stroiman_todo_comments_setup = true;
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "todo-comments" then
      setup_todo_comments()
    end
  end
})

if vim.g.stroiman_todo_comments_setup then
  setup_todo_comments()
end
