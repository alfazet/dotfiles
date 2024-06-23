return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            styles = {
                transparency = false,
            },
            highlight_groups = {
                MsgArea = {
                    bg = "none",
                },
                StatusLine = {
                    bg = "none",
                },
            },
        })
    end,
}
