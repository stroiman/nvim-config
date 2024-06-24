local win_events = vim.api.nvim_create_augroup("stroiman_win_events", {})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = win_events,
  callback = function(ev)
    local filetype = vim.fn.getbufvar(ev.buf, "&filetype")
    if (filetype == "help") then
      vim.cmd [[
        if winnr('$') < 3
          wincmd L
          vertical resize 80
        endif
      ]]
    end
  end
})
