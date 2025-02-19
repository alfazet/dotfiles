return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            exclude = {
                filetypes = { "help", "terminal", "lazy", "lspinfo", "" },
                buftypes = { "terminal" }
            },
            indent = { char = "▏", },
            scope = { enabled = false },
        })
    end,
}
