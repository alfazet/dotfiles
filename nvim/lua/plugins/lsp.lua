return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local servers = {
            bashls = {
                cmd = { "bash-language-server", "start" },
            },
            clangd = {
                cmd = { "clangd", "--clang-tidy", "--offset-encoding=utf-16" },
                filetypes = { "c", "cpp", "cuda" },
            },
            rust_analyzer = {},
            ty = {},
        }
        local base_capabilities = vim.lsp.protocol.make_client_capabilities()
        for server, config in pairs(servers) do
            if config.capabilities then
                config.capabilities = vim.tbl_deep_extend("force", base_capabilities, config.capabilities)
            else
                config.capabilities = base_capabilities
            end
            local custom_on_attach = config.on_attach
            config.on_attach = function(client, bufnr)
                if custom_on_attach then
                    custom_on_attach(client, bufnr)
                end
            end
            vim.lsp.config(server, config)
            vim.lsp.enable(server)
        end
    end,
}
