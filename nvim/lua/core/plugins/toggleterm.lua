return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            shade_terminals = false,
            direction = "float",
        })
        vim.keymap.set('n', '<Leader>tt', '<Cmd>ToggleTerm<CR>') 
    end,
}
