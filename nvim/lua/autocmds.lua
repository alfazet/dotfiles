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

compilers = {
    tex = function()
        vim.cmd("!tectonic %")
    end,
    typst = function()
        vim.cmd("!typst compile %")
    end,
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local compiler = compilers[args.match]
        if not compiler then
            return
        end
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>ll", "", {
            noremap = true,
            silent = true,
            callback = function()
                compiler()
            end,
        })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

-- stop comments from continuing on new lines
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})
