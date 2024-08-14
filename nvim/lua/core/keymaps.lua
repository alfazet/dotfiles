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

-- toggle line wrapping
vim.keymap.set("n", "<Leader>ww", ":set wrap!<CR>")

-- go to file (create if it doesn't exist already)
vim.keymap.set("n", "gf", ":e<cfile><CR>")

-- quickfix list
-- vim.keymap.set("n", "<Leader>qq", function()
--     local qf_exists = false
--     for _, win in pairs(vim.fn.getwininfo()) do
--         if win["quickfix"] == 1 then
--             qf_exists = true
--         end
--     end
--     if qf_exists == true then
--         vim.cmd("cclose")
--         return
--     end
--     vim.diagnostic.setqflist()
--     vim.cmd("sleep 100m") -- gives it time to fill the list
--     vim.cmd("copen")
-- end)
