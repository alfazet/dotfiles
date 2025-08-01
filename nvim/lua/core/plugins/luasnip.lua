return {
    "L3MON4D3/LuaSnip",
    ft = { "tex", "markdown" },
    version = "2.*",
    build = "make install_jsregexp",
    config = function()
        require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/lua/core/snippets" })
        local luasnip = require("luasnip")
        luasnip.setup({
            enable_autosnippets = true,
        })
        luasnip.filetype_extend("markdown", { "tex" })
        vim.keymap.set({ "i", "s" }, "<C-h>", function()
            luasnip.jump(-1)
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            luasnip.jump(1)
        end, { silent = true })
    end,
}
