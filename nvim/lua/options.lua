vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.termguicolors = true
vim.o.mouse = ""
vim.o.guicursor = ""

vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = false

vim.o.scrolloff = 10
vim.o.wrap = false
vim.o.linebreak = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.laststatus = 3
vim.o.statusline = "%f %m %= %y %l:%c %{mode()}"
vim.o.pumblend = 15
vim.o.list = true
vim.o.listchars = "trail:~"
vim.o.pumheight = 10
vim.o.signcolumn = "yes"

vim.o.cmdheight = 0
require("vim._core.ui2").enable()

vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.cache/nvim_undodir"
vim.o.swapfile = false
vim.o.inccommand = "split"
vim.o.updatetime = 500
vim.o.grepprg = "rg --vimgrep --no-messages --smart-case"

function _G.find_files(match, _)
    local names = vim.fn.systemlist("fd -t f --color=never")
    if #match == 0 then
        return names
    else
        return vim.fn.matchfuzzy(names, match)
    end
end
vim.o.findfunc = "v:lua.find_files"

vim.cmd("syntax off")
