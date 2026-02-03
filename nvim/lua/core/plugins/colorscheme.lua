return {
    url = "https://github.com/alfazet/red-phosphor.nvim",
    config = function()
        local theme = require("red-phosphor/init")
        theme.setup({
            integrations = { "fzf" },
        })
        theme.colorscheme()
    end,
}
