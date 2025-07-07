return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
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
                    return not context.in_treesitter_capture("comment")
                end
            end,
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-f>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                {
                    name = "buffer",
                    option = { keyword_pattern = [[\%C\k\+]] },
                },
            }),
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            window = {
                completion = {
                    scrollbar = false,
                    winhighlight = "Normal:CmpNormal",
                },
                documentation = {
                    scrollbar = false,
                    winhighlight = "Normal:CmpNormal",
                },
            },
        })
    end,
}
