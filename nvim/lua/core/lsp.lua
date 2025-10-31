vim.lsp.enable({ "ruff" })

-- very buggy with CUDA
vim.lsp.enable({ "clangd" })

-- rust-analyzer is slow, so enable it manually
-- only when needed
vim.lsp.enable("rust-analyzer")
