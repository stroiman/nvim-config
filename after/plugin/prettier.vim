" :command! Prettier normal mz:%!prettierd %<CR>'zzz
function! Prettier()
  let save_cursor = getcurpos()
  normal ix
  undoj
  normal "_x
  undoj
  silent %!prettierd %
  if v:shell_error != 0
    undo
    echomsg 'Prettier failed.'
  endif
  call setpos('.', save_cursor)
endfunction

augroup prettier
  au!
  " au BufWritePost *.ts :FormatWrite
  " au BufWritePost *.js :FormatWrite
  " au BufWritePost *.tsx :FormatWrite
  " au BufWritePost *.jsx :FormatWrite
  au BufWritePre *.ts call Prettier()
  au BufWritePre *.js call Prettier()
  au BufWritePre *.tsx call Prettier()
  au BufWritePre *.jsx call Prettier()
augroup end
