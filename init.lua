-- Affects CursorHold (highlight current symbol)
vim.opt.updatetime = 1000
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.textwidth = 80
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = false
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = [[^\.git\/$]]
vim.g.netrw_sort_sequence = "\\/$,*"
vim.o.timeout = true
vim.o.timeoutlen = 500

local function reload()
  for name, _ in pairs(package.loaded) do
    if name:match("^stroiman") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Configuration reloaded", vim.log.levels.INFO)
end

local load_init_file = function()
  if vim.fn.getcwd() == vim.fn.stdpath("config") then
    vim.cmd("e $MYVIMRC")
  else
    vim.cmd([[tabnew +tcd\ %:p:h $MYVIMRC]])
  end
end

-- Remove some default keyboard shortcuts that are annoying

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>h", vim.cmd.nohlsearch)
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>vs", reload, { desc = "Source init.lua" })
vim.keymap.set("n", "<leader>vw", function()
  vim.cmd([[w]])
  reload()
end, { desc = "Write current file and source init.lua" })
vim.keymap.set("n", "<leader>ve", load_init_file, { desc = "Edit init.lua in new tab" })
vim.keymap.set("n", "<leader>vx", [[:w<cr>:so %<cr>]], { desc = "Save and execute current file" })
vim.keymap.set("n", "<leader>vwe", [[:vsplit +lcd\ %:p:h $MYVIMRC<cr>]])
vim.keymap.set("n", "<leader>voe", [[:tabnew +tcd\ %:p:h ~/.config/nvim-old/init.lua<cr>]])
vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("i", "<C-s>", "<esc>:w<cr>")
-- Tip from https://medium.com/@kadek/understanding-vims-jump-list-7e1bfc72cdf0
vim.keymap.set({ "n", "v" }, "j", [[(v:count > 1 ? "m'" . v:count . 'j' : 'gj')]], { expr = true })
vim.keymap.set({ "n", "v" }, "k", [[(v:count > 1 ? "m'" . v:count . 'k' : 'gk')]], { expr = true })

require("stroiman")
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("tokyonight-night")

function P(args)
  print(vim.inspect(args))
  return args
end

function FixOutlierScript()
  vim.cmd([[:%s/\n\n\n/\r\r\r\r/g
:%s/\n\n/\r/g]])
end

vim.keymap.set("n", "<leader>xx", FixOutlierScript)
