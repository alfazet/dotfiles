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
                layout_config = {
                    horizontal = {
                        preview_cutoff = 0,
                    },
                },
                file_ignore_patterns = {
                    "python3",
                    ".*%.eps",
                    ".*%.pdf",
                    ".*%.svg",
                    ".*%.synctex.gz",
                },
            },
        })
        local builtin = require("telescope.builtin")
        local previewers = require("telescope.previewers")
        vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<Leader>bb", builtin.buffers, {})
        vim.keymap.set("n", "<Leader>gg", builtin.live_grep, {})
        vim.keymap.set("n", "<Leader>ls", builtin.diagnostics, {})
        vim.keymap.set("n", "<Leader>ma", builtin.marks, {})
    end,
}
