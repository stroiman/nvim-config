-- Affects CursorHold (highlight current symbol)
vim.opt.updatetime = 1000
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = false
vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = [[^\.git\/$]]

local reload = function()
  for name, _ in pairs(package.loaded) do
    if name:match("^stroiman") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Configuration reloaded", vim.log.levels.INFO)
end

local load_init_file = function()
  if vim.fn.getcwd() == vim.fn.stdpath('config') then
    vim.cmd "e $MYVIMRC"
  else
    vim.cmd [[tabnew +tcd\ %:p:h $MYVIMRC]]
  end
end

-- Remove some default keyboard shortcuts that are annoying

-- unmap <C-a> & <C-x> - increment/decrement .
-- Particularly <C-a> interferes with my tmux config (common to use C-a)
-- `silent!` to suppress errors when re-sourcing vimrc file
vim.cmd [[
  silent! unmap <C-a>
  silent! unmap <C-x>
]]

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>h", vim.cmd.nohlsearch)
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>vs", reload)
vim.keymap.set("n", "<leader>vw", function()
  vim.cmd [[w]]
  reload()
end)
vim.keymap.set("n", "<leader>ve", load_init_file)
vim.keymap.set("n", "<leader>vmm", ":messages<cr>")
vim.keymap.set("n", "<leader>vmc", ":messages clear<cr>")
vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("i", "<C-s>", "<esc>:w<cr>")
vim.keymap.set("n", "-", [[:Ex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-h", [[:30Lex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-l", [[:30Lex! <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-j", [[:40Hex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
vim.keymap.set("n", "<leader>-k", [[:40Hex! <bar> :sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>]])
-- Tip from https://medium.com/@kadek/understanding-vims-jump-list-7e1bfc72cdf0
vim.keymap.set("n", "<expr>j", [[(v:count > 1 ? "m'" . v:count : '') . 'j']])
vim.keymap.set("n", "<expr>k", [[(v:count > 1 ? "m'" . v:count : '') . 'k']])
vim.keymap.set("n", "[q", [[:silent! cprev<CR>]], { silent = true })
vim.keymap.set("n", "]q", [[:silent! cnext<CR>]], { silent = true })

require("stroiman")

vim.cmd.colorscheme "catppuccin"

function P(args)
  print(vim.inspect(args))
  return args
end
