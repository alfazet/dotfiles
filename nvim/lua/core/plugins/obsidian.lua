return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "ibhagwan/fzf-lua",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("obsidian").setup({
            notes_subdir = "notes",
            preferred_link_style = "wiki",
            workspaces = {
                {
                    name = "vault",
                    path = "~/Sync/vault",
                },
            },
            ui = {
                enable = false,
            },
            completion = {
                min_chars = 0,
            },
            attachments = {
                img_folder = "images",
            }
        })
        vim.keymap.set("n", "<Leader>os", "<Cmd>ObsidianOpen<CR>")
        vim.keymap.set("n", "<Leader>ot", "<Cmd>ObsidianTags<CR>")
        vim.keymap.set("n", "<Leader>of", "<Cmd>ObsidianSearch<CR>")
        vim.keymap.set("n", "<Leader>oi", "<Cmd>ObsidianPasteImg<CR>")
    end
}
