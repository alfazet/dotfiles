return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require("luasnip").config.set_config({
            history = false,
            enable_autosnippets = true,
        })
        require("luasnip.loaders.from_vscode").lazy_load({
            exclude = { "tex" },
        })
        -- expand snippet
        vim.cmd([[imap <silent><expr> <jk> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<jk>']])

        -- jump to the next anchor point
        vim.cmd([[imap <silent><expr> <C-l> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-l>']])
        vim.cmd([[smap <silent><expr> <C-l> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-l>']])

        -- jump to the prev anchor point
        vim.cmd([[imap <silent><expr> <C-f> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-f>']])
        vim.cmd([[smap <silent><expr> <C-f> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-f>']])
    end,
}
