local utils = require("core.snippets.snippet_utils")
local s = utils.s
local d = utils.d
local f = utils.f
local fmta = utils.fmta
local get_visual = utils.get_visual
local in_text = utils.in_text

return {
    s({ trig = "([^%\\])mk", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>$<>$",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = in_text }
    ),
}
