local helpers = require("core.snippets.helper-functions")
local get_visual = helpers.get_visual

local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({ trig = ";a", snippetType = "autosnippet" },
        {
            t("\\alpha"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";b", snippetType = "autosnippet" },
        {
            t("\\beta"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";g", snippetType = "autosnippet" },
        {
            t("\\gamma"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";G", snippetType = "autosnippet" },
        {
            t("\\Gamma"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";d", snippetType = "autosnippet" },
        {
            t("\\delta"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";D", snippetType = "autosnippet" },
        {
            t("\\Delta"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";e", snippetType = "autosnippet" },
        {
            t("\\varepsilon"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";l", snippetType = "autosnippet" },
        {
            t("\\lambda"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";m", snippetType = "autosnippet" },
        {
            t("\\mu"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";x", snippetType = "autosnippet" },
        {
            t("\\xi"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";i", snippetType = "autosnippet" },
        {
            t("\\pi"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";r", snippetType = "autosnippet" },
        {
            t("\\rho"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";s", snippetType = "autosnippet" },
        {
            t("\\sigma"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";o", snippetType = "autosnippet" },
        {
            t("\\theta"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";f", snippetType = "autosnippet" },
        {
            t("\\varphi"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";F", snippetType = "autosnippet" },
        {
            t("\\Phi"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";c", snippetType = "autosnippet" },
        {
            t("\\chi"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";p", snippetType = "autosnippet" },
        {
            t("\\psi"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";w", snippetType = "autosnippet" },
        {
            t("\\omega"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";k", snippetType = "autosnippet" },
        {
            t("\\kappa"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";t", snippetType = "autosnippet" },
        {
            t("\\tau"),
        }, { condition = tex.in_mathzone }),
    s({ trig = ";W", snippetType = "autosnippet" },
        {
            t("\\Omega"),
        }, { condition = tex.in_mathzone }),
    s({ trig = "([^%a])l%(", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>\\left(<>\\right)",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])l%[", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>\\left[<>\\right]",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])l%{", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>\\left\\{<>\\right\\}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])l%|", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>\\left|<>\\right|",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),
    s({ trig = "sct", snippetType = "autosnippet" },
        fmta(
            [[
        \section{<>}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
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
    s({ trig = "eqn", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{equation*}
            <>
        \end{equation*}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "aln", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{align*}
            <>
        \end{align*}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "gth", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{gather*}
            <>
        \end{gather*}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "thm", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{theorem}
            <>
        \end{theorem}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "lmm", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{lemma}
            <>
        \end{lemma}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "prf", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{proof}
            <>
        \end{proof}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "sln", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{solution}
            <>
        \end{solution}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "def", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{definition}
            <>
        \end{definition}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "exa", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{example}
            <>
        \end{example}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "alg", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{algorithm}
            \begin{algorithmic}[1]
                <>
            \end{algorithmic}
        \end{algorithm}
      ]],
            {
                i(1),
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
    s({ trig = "enn", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{enumerate}
            \item <>
        \end{enumerate}
      ]],
            {
                i(0),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "bmat", snippetType = "autosnippet" },
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
        { condition = line_bgein and tex.in_mathzone }
    ),
    s({ trig = "([^%a])vv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\vec{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])tl", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\tl{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])bar", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\ol{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])hat", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\hat{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\frac{<>}{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
                i(2),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\sqrt{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a%\\])lim", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\lim_{<>\\to<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
                i(2),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])summ", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\sum_{<>}^{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
                i(2),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])ser", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\sum_{n=0}^{\\infty}",
            {
                f(function(_, snip) return snip.captures[1] end),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])prodd", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\prod_{<>}^{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
                i(2),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\int_{<>}^{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
                i(2),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%a])intf", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\int_{-\\infty}^{+\\infty}",
            {
                f(function(_, snip) return snip.captures[1] end),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "..", snippetType = "autosnippet" },
        {
            t("\\dots"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "lg", snippetType = "autosnippet" },
        {
            t("\\ln"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "sin", snippetType = "autosnippet" },
        {
            t("\\sin"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "cos", snippetType = "autosnippet" },
        {
            t("\\cos"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "tg", snippetType = "autosnippet" },
        {
            t("\\tg"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "ctg", snippetType = "autosnippet" },
        {
            t("\\ctg"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "asin", snippetType = "autosnippet" },
        {
            t("\\arcsin"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "acos", snippetType = "autosnippet" },
        {
            t("\\arccos"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "atg", snippetType = "autosnippet" },
        {
            t("\\arctg"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "actg", snippetType = "autosnippet" },
        {
            t("\\arcctg"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "oo", snippetType = "autosnippet" },
        {
            t("\\infty"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "::", snippetType = "autosnippet" },
        {
            t("\\colon"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = ":=", snippetType = "autosnippet" },
        {
            t("\\coloneq"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "ii", snippetType = "autosnippet" },
        {
            t("\\ii"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "ee", snippetType = "autosnippet" },
        {
            t("\\ee"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "dd", snippetType = "autosnippet" },
        {
            t("\\dd"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "pd", snippetType = "autosnippet" },
        {
            t("\\partial"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "<->", snippetType = "autosnippet" },
        {
            t("\\xleftrightarrow"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "<--", snippetType = "autosnippet" },
        {
            t("\\xleftarrow"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "-->", snippetType = "autosnippet" },
        {
            t("\\xrightarrow"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "->->", snippetType = "autosnippet" },
        {
            t("\\rightrightarrows"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "<-<-", snippetType = "autosnippet" },
        {
            t("\\leftleftarrows"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = ">>", snippetType = "autosnippet" },
        {
            t("\\implies"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "_-", snippetType = "autosnippet" },
        {
            t("\\hyph"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "baa", snippetType = "autosnippet" },
        {
            t("\\bigcap"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "buu", snippetType = "autosnippet" },
        {
            t("\\bigcup"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "sbs", snippetType = "autosnippet" },
        {
            t("\\subseteq"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "eset", snippetType = "autosnippet" },
        {
            t("\\emptyset"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "smi", snippetType = "autosnippet" },
        {
            t("\\setminus"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "inn", snippetType = "autosnippet" },
        {
            t("\\in"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "fora", snippetType = "autosnippet" },
        {
            t("\\forall"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "exi", snippetType = "autosnippet" },
        {
            t("\\exists"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "NN", snippetType = "autosnippet" },
        {
            t("\\NN"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "ZZ", snippetType = "autosnippet" },
        {
            t("\\ZZ"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "QQ", snippetType = "autosnippet" },
        {
            t("\\QQ"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "RR", snippetType = "autosnippet" },
        {
            t("\\RR"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "CC", snippetType = "autosnippet" },
        {
            t("\\CC"),
        },
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%\\])tt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\text{ <> }",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%\\])var", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\texttt{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        {}
    ),
    s({ trig = "([^%\\])set", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\{<>\\}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%\\])ang", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\langle<>\\rangle",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
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
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([%w%)%]%}])'", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>^{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([%w%)%]%}]);", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>_{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([%w%)%]%}])__", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>_{<>}^{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
                i(2),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = '([%w%)%]%}])"', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>'",
            {
                f(function(_, snip) return snip.captures[1] end),
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({ trig = "([^%\\])mk", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\(<>\\)",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ),
        { condition = tex.in_text }
    ),
    s({ trig = "ifsta", snippetType = "autosnippet" },
        fmta(
            [[
            \If{<>}
                <>
            \EndIf
      ]],
            {
                i(1),
                i(2),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "forloop", snippetType = "autosnippet" },
        fmta(
            [[
            \For{<>}
                <>
            \EndFor
      ]],
            {
                i(1),
                i(2),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "whileloop", snippetType = "autosnippet" },
        fmta(
            [[
            \While{<>}
                <>
            \EndWhile
      ]],
            {
                i(1),
                i(2),
            }
        ),
        { condition = line_begin }
    ),
    s({ trig = "code", snippetType = "autosnippet" },
        fmta(
            [[
            \lstinputlisting[language=<>]{figures/<>}
      ]],
            {
                i(1),
                i(2),
            }
        ),
        { condition = line_begin }
    ),
}
