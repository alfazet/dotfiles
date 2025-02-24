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
    local dir = vim.fs.root(0, { ".git" })
    if dir == nil then
        return os.getenv("HOME")
    end
    return dir
end

M.random_hex_id = function(n)
    local chars = "012345689abcdef"
    local s = ""
    for _ = 1, n do
        local i = math.random(1, #chars)
        s = s .. chars:sub(i, i)
    end
    return s
end

return M
