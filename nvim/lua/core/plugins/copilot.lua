return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = { enabled = false },
            suggestion = { auto_trigger = true, keymap = { accept = "<Tab>",}, },
            filetypes = {
                python = true,
                c = true,
                cpp = true,
                rust = true,
                javascript = true,
                html = true,
                css = true,
                ["*"] = false,
            },
        })
    end,
}
