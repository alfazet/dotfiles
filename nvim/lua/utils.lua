local M = {}

M.toggle_qf = function()
    for _, info in ipairs(vim.fn.getwininfo()) do
        if info.quickfix == 1 then
            vim.cmd("cclose")
            return
        end
    end
    if next(vim.fn.getqflist()) == nil then
        return
    end
    vim.cmd("copen")
end

M.open_pdf = function()
    local name = vim.fn.expand("%:t:r")
    vim.system({ "zathura", name .. ".pdf" })
end

M.is_cmdline_type_find = function()
    local cmdline_cmd = vim.fn.split(vim.fn.getcmdline(), ' ')[1]
    return cmdline_cmd == "find"
end

return M
