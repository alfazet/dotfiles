return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({})
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local lspconfig = require("lspconfig")
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lsp_on_attach = function(client)
                client.server_capabilities.semanticTokensProvider = nil
                vim.keymap.set("n", "<Leader>mn", function()
                    vim.lsp.buf.hover()
                    vim.lsp.buf.hover()
                end)
                vim.keymap.set("n", "<Leader>df", vim.lsp.buf.definition)
                vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename)
                vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition)
                vim.keymap.set("n", "<Leader>rf", "<cmd> Telescope lsp_references <CR>")
                vim.cmd([[:hi DiagnosticUnderlineWarn cterm=undercurl gui=undercurl]])
                vim.cmd([[:hi DiagnosticUnderlineError cterm=undercurl gui=undercurl]])
                vim.cmd([[:hi DiagnosticUnderlineHint cterm=undercurl gui=undercurl]])
                vim.diagnostic.config({
                    virtual_text = false,
                })
                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = bufnr,
                    callback = function()
                        local opts = {
                            focusable = false,
                            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                            border = "single",
                            source = "always",
                            prefix = " ",
                            scope = "cursor",
                        }
                        vim.diagnostic.open_float(nil, opts)
                    end
                })
            end

            -- C++
            lspconfig.clangd.setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_on_attach,
                cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                },
            })
            -- Rust
            lspconfig.rust_analyzer.setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_on_attach,
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                },
            })
            -- Python
            lspconfig.basedpyright.setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_on_attach,
                settings = {
                    basedpyright = {
                        typeCheckingMode = "basic",
                    },
                },
            })
            -- Go
            lspconfig.gopls.setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_on_attach,
            })
            -- Lua
            -- lspconfig.lua_ls.setup({
            --     capabilities = lsp_capabilities,
            --     on_attach = lsp_on_attach,
            --     settings = {
            --         Lua = {
            --             diagnostics = {
            --                 globals = { "vim" }
            --             }
            --         }
            --     },
            -- })
        end,
    },
}
