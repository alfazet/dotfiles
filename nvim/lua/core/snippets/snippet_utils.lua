local M = {}

local _, ts = pcall(require, "vim.treesitter")
local _, query = pcall(require, "vim.treesitter.query")
local ls = require("luasnip")
M.s = ls.snippet
M.sn = ls.snippet_node
M.t = ls.text_node
M.i = ls.insert_node
M.f = ls.function_node
M.d = ls.dynamic_node
M.fmt = require("luasnip.extras.fmt").fmt
M.fmta = require("luasnip.extras.fmt").fmta
M.rep = require("luasnip.extras").rep

-- credit: github.com/kunzaatko/nvim-dots
local MATH_ENVS = {
    displaymath = true,
    equation = true,
    [ [[equation*]] ] = true,
    multline = true,
    eqnarray = true,
    align = true,
    [ [[align*]] ] = true,
    array = true,
    split = true,
    alignat = true,
    gather = true,
    flalign = true,
    [ [[flalign*]] ] = true,
    aligned = true,
}
local MATH_NODES = {
    math_environment = true,
    displayed_equation = true,
    inline_formula = true,
    text_mode = false,
}

local function get_node_at_cursor()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local cursor_range = { cursor[1] - 1, cursor[2] }
    local buf = vim.api.nvim_get_current_buf()
    local ok, parser = pcall(ts.get_parser, buf, "latex")
    if not ok or not parser then
        return
    end
    local root_tree = parser:parse()[1]
    local root = root_tree and root_tree:root()

    if not root then
        return
    end

    return root:named_descendant_for_range(cursor_range[1], cursor_range[2], cursor_range[1], cursor_range[2])
end

function M.get_visual(_, parent)
    if #parent.snippet.env.LS_SELECT_RAW > 0 then
        return M.sn(nil, M.i(1, parent.snippet.env.LS_SELECT_RAW))
    else
        return M.sn(nil, M.i(1, ""))
    end
end

function M.in_math()
    local buf = vim.api.nvim_get_current_buf()
    local node = get_node_at_cursor()
    while node do
        if MATH_NODES[node:type()] ~= nil then
            return MATH_NODES[node:type()]
        end

        if node:type() == "generic_environment" then
            local begin = node:child(0)
            local names = begin and begin:field("name")
            if names and names[1] then
                local env_name = ts.get_node_text(names[1], buf):match("{([a-zA-Z%d%*]*)}")
                if MATH_ENVS[env_name] ~= nil then
                    return MATH_ENVS[env_name]
                end
            end
        end
        node = node:parent()
    end
end

function M.in_text()
    return not M.in_math()
end

return M
