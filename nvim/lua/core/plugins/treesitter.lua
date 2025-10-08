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
                "cuda",
                "html",
                "latex",
                "make",
                "markdown",
                "markdown-inline",
                "python",
                "rust",
            })
        end,
    },
}
