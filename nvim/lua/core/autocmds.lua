vim.api.nvim_create_autocmd("FileType", {
    pattern = { "bash", "c", "cpp", "cuda", "css", "dart", "html", "javascript", "markdown", "python", "rust", "tex", "typst" },
    callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank() end,
})
