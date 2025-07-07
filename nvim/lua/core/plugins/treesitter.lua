return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "main",
        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })
            require("nvim-treesitter").install({
                "bash",
                "c",
                "cpp",
                "css",
                "html",
                "latex",
                "make",
                "markdown",
                "markdown-inline",
                "python",
                "r",
                "rust",
                "typst",
            })
        end,
    },
}
