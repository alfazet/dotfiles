return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies =
    {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").setup({
            defaults = {
                layout_strategy = "bottom_pane",
                layout_config = {
                    height = 0.5,
                    preview_cutoff = 60
                },
                initial_mode = "normal",
                sorting_strategy = "ascending",
                preview = true,
                border = true,
                borderchars = {
                    prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                    results = { " " },
                    preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                },
                results_title = false,
                file_ignore_patterns = {
                    "aux/",
                    "target/",
                    "venv/",
                    ".*%.bak",
                    ".*%.pdf",
                    ".*%.gz$",
                    ".*%.jpg$",
                    ".*%.png$",
                    ".*%.webp$",
                    ".*%.mp3$",
                    ".*%.mp4$",
                    ".*%.mkv$",
                    ".*%.o$",
                    ".*%.so$",
                    ".*%.lock$",
                    ".*%.xopp$",
                },
            },
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<Leader>gg", builtin.live_grep, {})
        vim.keymap.set("n", "<Leader>hh", builtin.marks, {})
        vim.keymap.set("n", "<Leader>jj", builtin.diagnostics, {})

        require("telescope").load_extension("fzf")
    end,
}
