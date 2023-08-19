return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
        },
        {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({
                    fast_wrap = {},
                    disable_filetype = {"TelescopePrompt"},
                })
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end,
        },
        {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            enabled = function()
                local context = require("cmp.config.context")
                if vim.api.nvim_get_mode().mode == "c" then
                    return true
                else
                    return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
                end
            end,
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-[>"] = cmp.mapping.select_prev_item(),
                ["<C-]>"] = cmp.mapping.select_next_item(),
                ["<Tab>"] = cmp.mapping.confirm({select = true}),
                ["<Esc>"] = cmp.mapping({
                    i = function()
                        cmp.close()
                        vim.cmd.stopinsert()
                    end,
                }),
            }),
            sources = cmp.config.sources({
                {name = "nvim_lsp"},
                {name = "luasnip"},
                {name = "buffer"},
                {name = "nvim_lsp_signature_help"},
            })
        })
    end,
}
