local utils = require("core.utils")
local search_path = "/home/antek/.config/latex"
local log_file = "/tmp/tectonic.log"

vim.keymap.set("n", "<Leader>ll", function()
    local tex_file = vim.fn.expand("%")
    vim.cmd("redir! >" .. log_file)
    vim.cmd("silent !tectonic -Z search-path=" .. search_path .. " " .. tex_file)
    vim.cmd("redir END")
end)

vim.keymap.set("n", "<Leader>lv", function()
    utils.open_pdf()
end)
