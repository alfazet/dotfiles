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
        dependencies = {"hrsh7th/cmp-nvim-lsp"},
        config = function()
            local lspconfig = require("lspconfig")
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lsp_on_attach = function(client)
                client.server_capabilities.semanticTokensProvider = nil
                vim.keymap.set("n", "<Leader>mn", ":lua vim.lsp.buf.hover()<CR> :lua vim.lsp.buf.hover()<CR>")
                vim.keymap.set("n", "<Leader>df", ":lua vim.lsp.buf.definition()<CR>")
                vim.keymap.set("n", "<Leader>dc", ":lua vim.lsp.buf.declaration()<CR>")
                vim.keymap.set("n", "<Leader>rn", ":lua vim.lsp.buf.rename()<CR>")
                vim.keymap.set("n", "<Leader>rf", ":lua vim.lsp.buf.references()<CR>")
                vim.keymap.set("n", "<Leader>qf", ":lua vim.diagnostic.setqflist()<CR>")
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
                            close_events = {"BufLeave", "CursorMoved", "InsertEnter", "FocusLost"},
                            border = "rounded",
                            source = "always",
                            prefix = " ",
                            scope = "cursor",
                        }
                        vim.diagnostic.open_float(nil, opts)
                    end
                })
                --[[ vim.api.nvim_create_autocmd("BufWrite", {
                    buffer = bufnr,
                    callback = function()
                        vim.diagnostic.setqflist()
                    end
                }) ]]
            end

            local get_servers = require("mason-lspconfig").get_installed_servers
            for _, server_name in ipairs(get_servers()) do
                lspconfig[server_name].setup({
                    capabilities = lsp_capabilities,
                    on_attach = lsp_on_attach,
                    settings = {
                        completions = {
                            completeFunctionCalls = true,
                        },
                    },
                })
            end
        end,
    },
}
