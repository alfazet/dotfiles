local utils = require("core.snippets.snippet_utils")
local s = utils.s
local t = utils.t
local i = utils.i
local d = utils.d
local f = utils.f
local fmta = utils.fmta
local get_visual = utils.get_visual
local in_math = utils.in_math

return {
    s({ trig = "sin", snippetType = "autosnippet" }, {
        t("\\sin"),
    }, { condition = in_math }),
    s({ trig = "cos", snippetType = "autosnippet" }, {
        t("\\cos"),
    }, { condition = in_math }),
    s({ trig = "::", snippetType = "autosnippet" }, {
        t("\\colon"),
    }, { condition = in_math }),
    s({ trig = ":=", snippetType = "autosnippet" }, {
        t("\\coloneqq"),
    }, { condition = in_math }),
    s({ trig = "dd", snippetType = "autosnippet" }, {
        t("\\, \\mathrm{d}"),
    }, { condition = in_math }),
    s({ trig = "pd", snippetType = "autosnippet" }, {
        t("\\partial"),
    }, { condition = in_math }),
    s({ trig = "<->", snippetType = "autosnippet" }, {
        t("\\xleftrightarrow"),
    }, { condition = in_math }),
    s({ trig = "<--", snippetType = "autosnippet" }, {
        t("\\xleftarrow"),
    }, { condition = in_math }),
    s({ trig = "-->", snippetType = "autosnippet" }, {
        t("\\xrightarrow"),
    }, { condition = in_math }),
    s({ trig = ">>", snippetType = "autosnippet" }, {
        t("\\implies"),
    }, { condition = in_math }),
    s({ trig = "fora", snippetType = "autosnippet" }, {
        t("\\forall"),
    }, { condition = in_math }),
    s({ trig = "exi", snippetType = "autosnippet" }, {
        t("\\exists"),
    }, { condition = in_math }),

    s(
        { trig = "([^%a])vv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\vec{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            d(1, get_visual),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([^%a])tl", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\tilde{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            d(1, get_visual),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([^%a])bar", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\bar{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            d(1, get_visual),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\frac{<>}{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            d(1, get_visual),
            i(2),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\sqrt{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            d(1, get_visual),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([^%\\])var", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\sqrt{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            d(1, get_visual),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([^%a%\\])lim", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\lim_{<>\\to<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            i(1),
            i(2),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([^%a])summ", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\sum_{<>}^{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            i(1),
            i(2),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([^%a])sumf", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\sum_{<>}^{\\infty}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            i(1),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\int_{<>}^{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            i(1),
            i(2),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([^%a])intf", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\int_{-\\infty}^{+\\infty}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([%w%)%]%}])'", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>^{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            d(1, get_visual),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([%w%)%]%}]);", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>_{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            d(1, get_visual),
        }),
        { condition = in_math }
    ),
    s(
        { trig = "([%w%)%]%}])__", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>_{<>}^{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end),
            i(1),
            i(2),
        }),
        { condition = in_math }
    ),
    s(
        { trig = '([%w%)%]%}])"', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>'", {
            f(function(_, snip)
                return snip.captures[1]
            end),
        }),
        { condition = in_math }
    ),
}
