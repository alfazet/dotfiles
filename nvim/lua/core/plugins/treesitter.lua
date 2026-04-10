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
                "dart",
                "html",
                "hyprlang",
                "json",
                "latex",
                "lua",
                "make",
                "markdown",
                "python",
                "rust",
                "toml",
                "typst",
                "yaml",
            })
        end,
    },
}
