-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     priority = 1000,
--     config = function()
--         require("rose-pine").setup({
--             styles = {
--                 transparency = true,
--             },
--             highlight_groups = {
--                 MsgArea = { bg = "none" },
--                 StatusLine = { bg = "none" },
--                 StatusLineNC = { bg = "none" },
--                 CurSearch = { fg = "text", bg = "subtle", inherit = false },
--                 QuickFixLine = { fg = "rose" },
--                 CmpNormal = { bg = "base" },
--                 FzfLuaPathLineNr = { fg = "foam" },
--                 FzfLuaBufNr = { fg = "rose" },
--             },
--         })
--         vim.cmd.colorscheme("rose-pine")
--     end,
-- }

return {
    dir = "/home/antek/.local/share/nvim/lazy/red-phosphor",
    config = function()
        local theme = require("red-phosphor/init")
        theme.setup({
            transparent = true,
            integrations = { "fzf", "cmp", "ibl" },
        })
        theme.colorscheme()
    end,
}
