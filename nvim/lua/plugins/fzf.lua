return {
    "ibhagwan/fzf-lua",
    config = function()
        require("fzf-lua").setup({
            winopts = {
                split = "belowright",
                border = "single",
            },
            keymap = {
                fzf = {
                    ["ctrl-q"] = "select-all+accept",
                },
            },
            hls = {
                header_text = "Keyword",
                header_bind = "Keyword",
            },
        })

        vim.keymap.set("n", "<C-f>", "<Cmd>FzfLua vcs_files<CR>")
        vim.keymap.set("n", "<C-g>", "<Cmd>FzfLua grep_project<CR>")
        vim.keymap.set("n", "<C-8>", "<Cmd>FzfLua grep_cword<CR>")
    end,
}
