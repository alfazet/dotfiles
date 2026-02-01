return {
    url = "https://codeberg.org/alfazet/twm.nvim",
    config = function()
        local theme = require("twm/init")
        theme.setup({
            integrations = { "fzf" },
        })
        theme.colorscheme()
    end,
}
