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
    end,
}
