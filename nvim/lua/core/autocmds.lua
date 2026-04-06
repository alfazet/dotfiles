vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.api.nvim_create_autocmd({ "CmdlineChanged", "CmdlineLeave" }, {
    pattern = { "*" },
    group = vim.api.nvim_create_augroup("CmdlineAutocompletion", { clear = true }),
    callback = function(ev)
        local utils = require("core.utils")
        local function should_enable_autocomplete()
            local cmdline_cmd = vim.fn.split(vim.fn.getcmdline(), " ")[1]
            return utils.is_cmdline_type_find()
        end
        if ev.event == "CmdlineChanged" and should_enable_autocomplete() then
            vim.opt.wildmode = "noselect:lastused,full"
            vim.fn.wildtrigger()
        end
        if ev.event == "CmdlineLeave" then
            vim.opt.wildmode = "full"
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "bash", "sh", "zsh" },
    callback = function()
        vim.schedule(function()
            vim.keymap.set("n", "<Leader>fm", "<Cmd>silent !shfmt -i 4 -w %<CR>")
        end)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "cuda" },
    callback = function()
        vim.schedule(function()
            vim.keymap.set("n", "<Leader>fm", "<Cmd>silent !clang-format -i --fallback-style=Google %<CR>")
        end)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        vim.schedule(function()
            vim.keymap.set("n", "<Leader>fm", "<Cmd>silent !stylua --indent-type=Spaces --indent-width=4 %<CR>")
        end)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.schedule(function()
            vim.keymap.set("n", "<Leader>fm", "<Cmd>silent !ruff format %<CR>")
        end)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.schedule(function()
            vim.keymap.set("n", "<Leader>fm", "<Cmd>silent !cargo fmt<CR>")
        end)
    end,
})
