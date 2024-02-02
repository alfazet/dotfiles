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

-- stay in visual mode when indenting selected text
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- delete to the black hole register
vim.keymap.set("n", "<Leader>d", "\"_d")
vim.keymap.set("v", "<Leader>d", "\"_d")

-- paste from/yank to system clipboard
vim.keymap.set("n", "<Leader>p", "\"+p")
vim.keymap.set("v", "<Leader>p", "\"+p")
vim.keymap.set("n", "<Leader>y", "\"+y")
vim.keymap.set("v", "<Leader>y", "\"+y")

-- toggle line wrapping
vim.keymap.set("n", "<Leader>ww", ":set wrap!<CR>")

-- quickfix list
vim.keymap.set("n", "<Leader>qq", function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end
    if qf_exists == true then
        vim.cmd("cclose")
        return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then
        vim.cmd("copen")
    end
end)
