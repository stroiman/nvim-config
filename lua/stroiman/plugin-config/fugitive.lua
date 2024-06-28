local M = {}

vim.keymap.set("n", "<leader>gg", function()
  M.win = vim.api.nvim_get_current_win()
  vim.cmd("Git")
end)

local group = vim.api.nvim_create_augroup("stroiman_fugitive", {})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "fugitive",
  callback = function()
    local previous = M.win
    vim.keymap.set("n", "<leader>gg", function()
      vim.cmd.wincmd("q")
      vim.api.nvim_set_current_win(previous)
    end, { buffer = 0 })
  end,
})
