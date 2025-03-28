return {
    "neovim/nvim-lspconfig",
    config = function()
        local nvim_lsp = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local on_attach = function(_)
            vim.diagnostic.config({
                virtual_text = false
            })
            vim.keymap.set("n", "<Leader>mn", function()
                vim.lsp.buf.hover()
                vim.lsp.buf.hover()
            end)
            vim.keymap.set("n", "<Leader>rf", vim.lsp.buf.references)
            vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename)
            vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition)
            vim.keymap.set("n", "<Leader>di", vim.diagnostic.setqflist)
            vim.keymap.set("n", "<leader>fm", function()
                vim.lsp.buf.format({ async = true })
            end)
        end

        nvim_lsp.clangd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = {
                "clangd",
                "--clang-tidy",
                "--fallback-style=Microsoft",
                "--offset-encoding=utf-16",
            },
        })
        nvim_lsp.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })
        nvim_lsp.ruff.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        nvim_lsp.rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy",
                    },
                },
            },
        })
    end,
}
