local win_events = vim.api.nvim_create_augroup("stroiman_win_events", { })

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = win_events,
  callback = function(ev) 
    local filetype = vim.fn.getbufvar(ev.buf, "&filetype")
    if (filetype == "help") then
      vim.cmd [[
        if winnr('$') > 2
          wincmd K
        else
          wincmd L
        endif
        ]]
      end
    end
  })
