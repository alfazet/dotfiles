return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.mypy.with({
                    -- see issue https://github.com/nvimtools/none-ls.nvim/issues/97
                    args = function(params)
                        return {
                            "--hide-error-codes",
                            "--hide-error-context",
                            "--no-color-output",
                            "--show-absolute-path",
                            "--show-column-numbers",
                            "--show-error-codes",
                            "--no-error-summary",
                            "--no-pretty",
                            params.temp_path,
                        }
                    end,
                    on_output = function(line, params)
                        line = line:gsub(params.temp_path:gsub("([^%w])", "%%%1"), params.bufname)
                        return null_ls.builtins.diagnostics.mypy._opts.on_output(line, params)
                    end,
                }),
            },
        })

        vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format { async = true } end, {})
    end,
}
