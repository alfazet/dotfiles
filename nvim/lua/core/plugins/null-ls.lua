return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.clang_format.with({
                    disabled_filetypes = { },
                }),
                null_ls.builtins.formatting.black,
            },
        })

        vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format { async = true } end, {})
    end,
}
