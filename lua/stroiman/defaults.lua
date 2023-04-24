local opt = vim.opt

opt.relativenumber = false
opt.nu = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.swapfile=false
opt.backup=false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.colorcolumn = '80'

opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'

opt.backspace = 'indent,eol,start'

opt.clipboard:append('unnamedplus')

opt.splitright = true
opt.splitbelow = false

opt.iskeyword:append('-')

vim.g.netrw_banner = 0
