vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set("n", "<Leader>fm", "<Cmd>silent !dart format --set-exit-if-changed %<CR>")
