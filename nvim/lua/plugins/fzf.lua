return {
    "ibhagwan/fzf-lua",
    config = function()
        require("fzf-lua").setup({
            previewers = {
                syntax_limit_b = 32 * 1024,
                limit_b = 128 * 1024,
            },
            winopts = {
                border = "single",
            },
            keymap = {
                fzf = {
                    ["ctrl-q"] = "select-all+accept",
                    ["ctrl-d"] = "half-page-down",
                    ["ctrl-u"] = "half-page-up",
                },
            },
            hls = {
                header_text = "Keyword",
                header_bind = "Keyword",
            },

            files = {
                winopts = {
                    preview = { hidden = true },
                },
            },
            grep = {
                winopts = {
                    preview = { layout = "horizontal", horizontal = "right:66%" },
                },
            },
        })

        vim.keymap.set("n", "<C-f>", "<Cmd>FzfLua files<CR>")
        vim.keymap.set("n", "<C-g>", "<Cmd>FzfLua live_grep_native<CR>")
        vim.keymap.set("n", "<C-h>", "<Cmd>FzfLua grep_cword<CR>")
        vim.keymap.set("n", "<C-l>", "<Cmd>FzfLua lsp_workspace_diagnostics<CR>")
    end,
}
