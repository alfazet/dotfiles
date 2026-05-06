formatters = {
    c = function()
        vim.cmd("!clang-format -i --fallback-style=LLVM %")
    end,
    cpp = function()
        vim.cmd("!clang-format -i --fallback-style=LLVM %")
    end,
    cuda = function()
        vim.cmd("!clang-format -i --fallback-style=LLVM %")
    end,
    lua = function()
        vim.cmd("!stylua --indent-type=Spaces --indent-width=4 %")
    end,
    python = function()
        vim.cmd("!ruff format %")
    end,
    rust = function()
        vim.cmd("!cargo fmt")
    end,
    sh = function()
        vim.cmd("!shfmt -i 4 -w %")
    end,
    tex = function()
        vim.cmd("!tex-fmt %")
    end,
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local formatter = formatters[args.match]
        if not formatter then
            return
        end

        vim.api.nvim_buf_set_keymap(0, "n", "<leader>fm", "", {
            noremap = true,
            silent = true,
            callback = function()
                formatter()
            end,
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function(args)
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>ll", "", {
            noremap = true,
            silent = true,
            callback = function()
                vim.cmd("!tectonic %")
            end,
        })
    end,
})

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

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.api.nvim_create_autocmd({ "CmdlineChanged", "CmdlineLeave" }, {
    pattern = { "*" },
    group = vim.api.nvim_create_augroup("CmdlineAutocompletion", { clear = true }),
    callback = function(ev)
        local utils = require("utils")
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
