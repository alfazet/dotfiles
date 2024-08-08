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
                initial_mode = "normal",
                sorting_strategy = "ascending",
                preview = true,
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                results_title = false,
                file_ignore_patterns = {
                    "^venv/",
                    "^aux/",
                    ".*%.pdf",
                    ".*%.gz$",
                    ".*%.jpg$",
                    ".*%.png$",
                    ".*%.mp3$",
                    ".*%.mp4$",
                    ".*%.mkv$",
                    ".*%.o$",
                    ".*%.so$",
                    ".*%.lock$",
                },
            },
            pickers = {
                find_files = {
                    theme = "ivy",
                },
                live_grep = {
                    theme = "ivy",
                },
                marks = {
                    theme = "ivy",
                },
                diagnostics = {
                    theme = "ivy",
                },
            },
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<Leader>gg", builtin.live_grep, {})
        vim.keymap.set("n", "<Leader>hh", builtin.marks, {})
        vim.keymap.set("n", "<Leader>jj", builtin.diagnostics, {})
    end,
}
