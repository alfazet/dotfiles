return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local fzf = require("fzf-lua")
        local utils = require("core.utils")
        fzf.setup({
            "hide",
            winopts = {
                backdrop = 20,
                border = "single",
                title_flags = false,
            },
            keymap = {
                fzf = {
                    ["ctrl-q"] = "select-all+accept",
                },
            },
            fzf_colors = {
                ["bg"] = "-1",
                ["bg+"] = "-1:bold",
                ["gutter"] = "-1",
            },
            files = {
                cwd = utils.git_root(),
                cwd_prompt = false,
                no_header = true,
                formatter = "path.filename_first",
                actions = {
                    ["ctrl-h"] = { fzf.actions.toggle_hidden },
                    ["ctrl-i"] = { fzf.actions.toggle_ignore },
                },
            },
            grep = {
                cwd = utils.git_root(),
                cwd_prompt = false,
                no_header = true,
                actions = {
                    ["ctrl-h"] = { fzf.actions.toggle_hidden },
                    ["ctrl-i"] = { fzf.actions.toggle_ignore },
                },
            },
        })
        vim.keymap.set("n", "<C-f>", function()
            fzf.files({
                winopts = { preview = { hidden = "hidden" } },
            })
        end)
        vim.keymap.set("n", "<C-g>", function()
            fzf.live_grep()
        end)
    end,
}
