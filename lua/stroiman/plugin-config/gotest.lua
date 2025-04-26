local ok, gotest = pcall(require, "gotest")
if not ok then
  return
end

gotest.setup({
  aucommand_pattern = { "*.go", "*.cc", "*.h" },
  output_window = {
    show = "auto",
  },
})

local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
  return
end

local grp = vim.api.nvim_create_augroup("stroiman_gotest_lualine", { clear = true })

vim.api.nvim_create_autocmd("User", {
  group = grp,
  pattern = { "GoTestDone", "GoTestStart" },
  callback = function(ev)
    -- local data = ev.data
    lualine.refresh()
  end,
})
