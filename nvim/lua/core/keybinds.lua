-- unbind leader key
vim.keymap.set("", "<Space>", "<NOP>")

-- move by one line even through wraps
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })

-- keep the cursor centered when moving by half-screens
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep the cursor centered when scrolling through search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep the cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- stay in visual mode when indenting selected text
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- toggle line wrapping
vim.keymap.set("n", "<Leader>ww", "<Cmd>set wrap!<CR>")

-- search and replace word under the cursor
vim.keymap.set("n", "<Leader>rw", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])

-- netrw
vim.keymap.set("n", "<Leader>fv", "<Cmd>Ex<Cr>")

-- toggle quickfix list view
vim.keymap.set("n", "<C-q>", [[<Cmd>lua require("core.utils").toggle_qf()<CR>]])

-- move through the quickfix list
vim.keymap.set("n", "<C-n>", "<Cmd>try | cnext | catch | cfirst | catch | endtry<CR>")
vim.keymap.set("n", "<C-m>", "<Cmd>try | cprev | catch | clast | catch | endtry<CR>")

-- more sane comment keybinds
vim.keymap.set("n", "gll", "<Cmd>norm gcl<CR>")
vim.keymap.set("v", "gl", "<Cmd>norm gc<CR>")

-- pasting / deleting without overwriting the register
vim.keymap.set("x", "<Leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<Leader>d", [["_d]])

-- to avoid missclicking <C-d>
vim.keymap.set("i", "<C-d>", "<NOP>")
