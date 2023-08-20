return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
        require("catppuccin").setup({
            integrations = {
                mason = true,
            },
        })
    end,
}
