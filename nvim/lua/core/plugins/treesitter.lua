return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "bash", "c", "c_sharp", "cpp", "css", "go", "html", "javascript", "lua", "latex", "markdown", "markdown_inline", "matlab", "python", "rust", },
                highlight = {
                    enable = true,
                    disable = { "latex", },
                },
                indent = {
                    enable = false,
                },
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    }
}
