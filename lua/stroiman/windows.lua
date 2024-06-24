local win_events = vim.api.nvim_create_augroup("stroiman_win_events", {})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = win_events,
  callback = function(ev)
    local filetype = vim.fn.getbufvar(ev.buf, "&filetype")
    if (filetype == "help") then
      local winnr = vim.fn.winnr("$")
      local winsize = vim.fn.winwidth(0)
      if winnr < 3 and winsize >= 140 then
        vim.cmd [[
          wincmd L
          vertical resize 80
      ]]
      end
    end
  end
})
