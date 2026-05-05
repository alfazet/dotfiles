vim.keymap.set("", "<Space>", "<NOP>")

vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("c", "<C-j>", "<C-n>")
vim.keymap.set("c", "<C-k>", "<C-p>")
vim.keymap.set("c", "<C-f>", "<Cr>")

vim.keymap.set("n", "<C-q>", [[<Cmd>lua require("utils").toggle_qf()<CR>]])
vim.keymap.set("n", "<C-n>", "<Cmd>try | cnext | catch | cfirst | catch | endtry<CR>")
vim.keymap.set("n", "<C-m>", "<Cmd>try | cprev | catch | clast | catch | endtry<CR>")
vim.keymap.set("n", "<C-g>", "<Cmd>lua FzfLua.live_grep_native({ resume = true })<CR>")
vim.keymap.set("n", "<C-f>", ":find ")
