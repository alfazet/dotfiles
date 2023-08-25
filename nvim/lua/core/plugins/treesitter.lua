return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        {
            "windwp/nvim-ts-autotag",
            ft = {"html",},
        },
        {
            "nvim-treesitter/nvim-treesitter-context",
        },
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {"c", "cpp", "css", "html", "javascript", "lua", "python", "rust",},
            highlight = {
                enable = true,
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
