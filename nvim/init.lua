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
vim.opt.guicursor = "n:block-blinkon530,v:block,i:ver25-blinkon530"

-- save undo history between sessions
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim_undodir"
vim.opt.undofile = true

-- keep 10 lines of space above and below the cursor
vim.opt.scrolloff = 10

-- wrap only on full words
vim.opt.linebreak = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- highlight the number of the active line
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- don't show mode (a plugin will take care of that)
vim.opt.showmode = false

-- always show the signcolumn
vim.opt.signcolumn = "yes"

-- 24-bit colors
vim.opt.termguicolors = true

-- start the plugin manager
-- vim.loader().enable()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy").setup("core.plugins", {
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = false,
    },
})

-- load snippets
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/core/snippets/"})

-- load keymaps
require("core.keymaps")

-- set theme
vim.cmd.colorscheme("catppuccin")
