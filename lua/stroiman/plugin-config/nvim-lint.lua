local setup_nvim_lint = function()
  local lint = require("lint")
  lint.linters_by_ft = {
    javascript = { "eslint_d" },
  }

  vim.g.stroiman_nvim_lint_setup = true
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("stroiman_nvim_lint", {}),
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "nvim-lint" then
      setup_nvim_lint()
    end
  end,
})

if vim.g.stroiman_nvim_lint_setup then
  setup_nvim_lint()
end
