local utils = require("core.snippets.snippet_utils")
local s = utils.s
local i = utils.i
local d = utils.d
local f = utils.f
local fmta = utils.fmta
local rep = utils.rep
local get_visual = utils.get_visual
local in_math = utils.in_math
local in_text = utils.in_text
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({ trig = "([^%\\])mk", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\(<>\\)",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = in_text }
    ),
    s({ trig = "([^%a])l%(", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>\\left(<>\\right)",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = in_math }
    ),
    s({ trig = "([^%a])l%[", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>\\left[<>\\right]",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = in_math }
    ),
    s({ trig = "([^%a])l%{", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>\\left\\{<>\\right\\}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = in_math }
    ),
    s({ trig = "([^%a])l%|", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>\\left|<>\\right|",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = in_math }
    ),
    s({ trig = "env", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{<>}
            <>
        \end{<>}
      ]],
            {
                i(1),
                d(2, get_visual),
                rep(1),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "itt", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{itemize}
            \item <>
        \end{itemize}
      ]],
            {
                i(0),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "mat", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{bmatrix}
            <>
        \end{bmatrix}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin and in_math }
    ),
    s({ trig = "([^%\\])set", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\{<>\\}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = in_math }
    ),
    s({ trig = "([^%\\])ang", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\langle<>\\rangle",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = in_math }
    ),
    s({ trig = "([^%\\])bnn", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\binom{<>}{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
                d(2, get_visual),
            }
        ),
        { condition = in_math }
    ),
    s({ trig = "([^%\\])tt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\text{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = in_math }
    ),
    s({ trig = "([^%\\])var", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\texttt{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = in_math }
    ),
}
