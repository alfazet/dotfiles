return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {"BufReadPre " .. vim.fn.expand("~") .. "/Sync/notes/**.md"},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("obsidian").setup({
            dir = "~/Sync/notes",
            completion = {
                nvim_cmp = true,
            },
            mappings = {
                ["gf"] = require("obsidian.mapping").gf_passthrough(),
            },
        })
    end,
}
