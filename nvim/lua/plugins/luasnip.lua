return {
    "L3MON4D3/LuaSnip",
    lazy = true,
    version = "2.*",
    build = "make install_jsregexp",
    config = function()
        local luasnip = require("luasnip")
        vim.keymap.set({ "i", "s" }, "<C-h>", function()
            luasnip.jump(-1)
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            luasnip.jump(1)
        end, { silent = true })
    end,
}
