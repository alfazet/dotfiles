vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})
vim.lsp.enable({ "ruff" })

-- very buggy with CUDA
vim.lsp.enable({ "clangd" })

-- rust-analyzer is slow, so enable it manually
-- only when needed
-- vim.lsp.enable("rust-analyzer")
