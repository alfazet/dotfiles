return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            exclude = {filetypes = {"help", "terminal", "lazy", "lspinfo", 
            "TelescopePrompt", "TelescopeResults", "mason", ""}, buftypes = {"terminal"}},
            indent = {char = "▏",},
            scope = {enabled = false},
            -- show_trailing_blankline_indent = false,
            -- show_first_indent_level = false,
            -- show_current_context = false,
            -- show_current_context_start = true,
        })
    end,
}
