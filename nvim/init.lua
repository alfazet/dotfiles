vim.keymap.set("", "<Space>", "<NOP>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.mouse = ""
vim.opt.guicursor = "n:block,v:block,i:block"
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim_undodir"
vim.opt.undofile = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
vim.opt.pumheight = 8
vim.opt.pumwidth = 10
vim.opt.updatetime = 250
vim.opt.conceallevel = 0
vim.g.netrw_banner = 0

-- stop comments from continuing on the next line
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

-- start the figure manager on opening a .tex file
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.tex",
    callback = function()
        local tex_root_dir = vim.api.nvim_buf_get_name(0):match("(.*/)")
        vim.cmd(':silent exec "!inkman ' .. tex_root_dir .. ' figures observe"')
    end
})

vim.api.nvim_create_autocmd({ "VimLeavePre", }, {
    pattern = "*.tex",
    callback = function()
        vim.cmd(':silent exec "!inkman kill"')
    end
})

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

require("lazy").setup("core.plugins", {
    change_detection = {
        enabled = true,
        notify = false,
    },
})

require("core.keymaps")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/core/snippets/" })
vim.cmd.colorscheme("rose-pine")
