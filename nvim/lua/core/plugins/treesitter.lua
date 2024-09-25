return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        {
            "windwp/nvim-ts-autotag",
            ft = {"html",},
        },
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {"bash", "c", "c_sharp", "cpp", "css", "go", "html", "javascript", "lua", "markdown", "markdown_inline", "matlab", "python", "rust",},
            highlight = {
                enable = true,
                disable = {"latex",},
            },
            indent = {
                enable = false,
            },
            autotag = {
                enable = true,
                filetypes = {"html",},
            },
        })
    end,
}
