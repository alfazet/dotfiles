-- utility function
--[[ local function map(modes, keys, result)
    vim.keymap.set(modes, keys, result, {noremap = true, silent = true})
end ]]

-- move by one line even through wraps
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- keep the cursor centered when moving by half-screens
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep the cursor centered when scrolling through search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep the cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- faster scrolling
vim.keymap.set("n", "<C-e>", "3<C-e>")
vim.keymap.set("n", "<C-y>", "3<C-y>")

-- move between windows
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- stay in visual mode when indenting selected text
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- don't replace register when pasting over something
vim.keymap.set("x", "<Leader>p", "\"_dP")

-- delete to the black hole register
vim.keymap.set("n", "<Leader>d", "\"_d")
vim.keymap.set("v", "<Leader>d", "\"_d")

-- toggle line wrapping
vim.keymap.set("n", "<Leader>ww", ":set wrap!<CR>")

-- view all buffers as vertical windows
vim.keymap.set("n", "<Leader>vv", ":vertical ball<CR>")

-- <Esc> to change to normal mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
