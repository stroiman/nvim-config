-- Behaviour to help "Zoom" behaviour
--
local function zoom()
  local winid = vim.api.nvim_get_current_win()
  vim.cmd("tab split")
  local new_winid = vim.api.nvim_get_current_win()

  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(new_winid),
    once = true,
    callback = function()
      vim.api.nvim_set_current_win(winid)
    end,
  })
end

vim.keymap.set("n", "<leader>zz", zoom)
