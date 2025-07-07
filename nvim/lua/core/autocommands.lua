vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 100,
        })
    end,
})

vim.api.nvim_create_autocmd("TermEnter", {
    pattern = "*",
    callback = function()
        vim.opt.laststatus = 0
    end,
})

vim.api.nvim_create_autocmd("TermLeave", {
    pattern = "*",
    callback = function()
        vim.opt.laststatus = 3
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "bash", "c", "cpp", "css", "html", "make", "markdown", "python", "r", "rust" },
    callback = function()
        vim.treesitter.start()
    end,
})
