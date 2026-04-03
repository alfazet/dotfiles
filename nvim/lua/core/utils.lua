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

M.git_root = function()
    local dir = vim.fs.root(0, { { ".root" }, { ".git" } })
    if dir == nil then
        return vim.uv.cwd()
    end
    return dir
end

M.open_pdf = function()
    local name = vim.fn.expand("%:t:r")
    vim.system({ "zathura", name .. ".pdf" })
end

return M
