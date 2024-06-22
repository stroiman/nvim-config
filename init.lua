vim.opt.expandtab=true
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.softtabstop=2
vim.opt.swapfile=false
vim.opt.splitright=true
vim.opt.splitbelow=false
vim.opt.nu=true
vim.g.netrw_banner=0
vim.g.netrw_liststyle=3
vim.g.netrw_list_hide= [[^\.git\/$]]

function Reload() 
  -- local buf = vim.api.nvim_create_buf(true, true)
  for name, _ in pairs(package.loaded) do
    -- print(string.format("Package: %s", name))
    -- vim.fn.appendbufline(buf, "$", name)
    if name:match("^stroiman") then
      package.loaded[name] = nil
    else
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Configuration reloaded", vim.log.levels.INFO)
end

-- Remove some default keyboard shortcuts that are annoying

-- unmap <C-a> & <C-x> - increment/decrement .
-- `silent!` to suppress errors when re-sourcing vimrc file
-- Particularly <C-a> interferes with my tmux config (common to use C-a)
vim.cmd [[silent! unmap <C-a>]]
vim.cmd [[silent! unmap <C-x>]]

-- Add keyboard shortcuts

vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>vs", Reload)
vim.keymap.set("n", "<leader>ve", ":tabnew +tcd\\ %:p:h $MYVIMRC<cr>")
vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("i", "<C-s>", "<esc>:w<cr>")
vim.keymap.set("n", "-", [[:Ex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-h", [[:30Lex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-l", [[:30Lex! <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-j", [[:40Hex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-k", [[:40Hex! <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])

require("stroiman")

vim.cmd.colorscheme "catppuccin"
