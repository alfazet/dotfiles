-- global variables
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- tui
vim.opt.termguicolors = true
vim.opt.mouse = ""
vim.opt.guicursor = ""

-- indentation
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smartindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- lines, view and formatting
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.signcolumn = "yes"
vim.opt.conceallevel = 0
vim.opt.laststatus = 3
vim.opt.statusline = "%f %m %= %y %l:%c"
vim.opt.cmdheight = 0
vim.opt.pumheight = 8
vim.opt.pumwidth = 10
vim.opt.pumblend = 15

-- misc
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim_undodir"
vim.opt.swapfile = false
vim.opt.updatetime = 100
vim.opt.inccommand = "split"
vim.opt.jumpoptions = "stack,view"
