-- 24-bit colors
vim.opt.termguicolors = true

-- set <Space> as the leader key
vim.keymap.set("", "<Space>", "<NOP>")
vim.g.mapleader = " "

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smartindent = true

-- searching 
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- no swapfiles
vim.opt.swapfile = false

-- disable the mouse completely
vim.opt.mouse = ""

-- cursor 
vim.opt.guicursor = "n:block,v:block,i:block"

-- save undo history between sessions
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim_undodir"
vim.opt.undofile = true

-- keep 10 lines of space above and below the cursor
vim.opt.scrolloff = 10

-- disable wrap by default
vim.opt.wrap = false

-- (if set) wrap only on full words
vim.opt.linebreak = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- highlight the number of the active line
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- always show the signcolumn 
vim.opt.signcolumn = "yes"

-- dimensions of popup windows
vim.opt.pumheight = 8
vim.opt.pumwidth = 10

-- reduce update time so that LSP diagnostic have less lag
vim.opt.updatetime = 250

-- stop comments from continuing on the next line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

-- recognize Asymptote (.asy) files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"},{
    pattern = "*.asy",
    command = "set filetype=asy commentstring=//%s"
})

-- start the plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy").setup("core.plugins", {
    change_detection = {
        enabled = true,
        notify = false,
    },
})

-- set theme
vim.cmd.colorscheme("rose-pine")

-- load snippets
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/core/snippets/"})

-- load keymaps
require("core.keymaps")
