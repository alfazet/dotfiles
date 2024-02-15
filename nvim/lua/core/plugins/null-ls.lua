return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.autopep8,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.latexindent,
            },
        })

        vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format { async = true } end, {})
    end,
}
