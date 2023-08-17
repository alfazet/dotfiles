-- utility function
local function map(modes, keys, result)
    vim.keymap.set(modes, keys, result, {noremap = true, silent = true})
end

-- move by one line even through wraps
map("n", "j", "gj")
map("n", "k", "gk")

-- keep the cursor centered when moving by half-screens
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- keep the cursor centered when scrolling through search results
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- keep the cursor in place when joining lines
map("n", "J", "mzJ`z")

-- faster scrolling
map("n", "<C-e>", "3<C-e>")
map("n", "<C-y>", "3<C-y>")

-- move between windows
map("n", "<C-j>", "<C-w>j")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- stay in visual mode when indenting selected text
map("v", "<", "<gv")
map("v", ">", ">gv")

-- move selected lines up or down
map("n", "<C-S-j>", ":move .+1<CR>")
map("n", "<C-S-k>", ":move .-2<CR>")
map("x", "<C-S-j>", ":m'>+<CR>gv=gv")
map("x", "<C-S-k>", ":m-2<CR>gv=gv")

-- toggle line wrapping
map("n", "<Leader>ww", ":set wrap!<CR>")

-- view all buffers as vertical windows
map("n", "<Leader>vv", ":vertical ball<CR>")

-- <Esc> to change to normal mode in the terminal
map("t", "<Esc>", "<C-\\><C-n>")
