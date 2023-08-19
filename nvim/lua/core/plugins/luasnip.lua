return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    config = function()
        require("luasnip").config.set_config({
            history = false,
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
        })
        -- expand snippet
        vim.cmd([[imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>']])

        -- jump to the next "anchor" point
        vim.cmd([[imap <silent><expr> <C-l> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-l>']])
        vim.cmd([[smap <silent><expr> <C-l> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-l>']])
    end,
}
