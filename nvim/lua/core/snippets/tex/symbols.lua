local utils = require("core.snippets.snippet_utils")
local s = utils.s
local t = utils.t
local i = utils.i
local d = utils.d
local f = utils.f
local fmta = utils.fmta
local get_visual = utils.get_visual
local in_math = utils.in_math
local in_text = utils.in_text
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({
        trig = ";a",
        snippetType = "autosnippet",
    }, {
        t("\\alpha"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";b",
        snippetType = "autosnippet",
    }, {
        t("\\beta"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";g",
        snippetType = "autosnippet",
    }, {
        t("\\gamma"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";G",
        snippetType = "autosnippet",
    }, {
        t("\\Gamma"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";d",
        snippetType = "autosnippet",
    }, {
        t("\\delta"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";D",
        snippetType = "autosnippet",
    }, {
        t("\\Delta"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";e",
        snippetType = "autosnippet",
    }, {
        t("\\varepsilon"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";z",
        snippetType = "autosnippet",
    }, {
        t("\\zeta"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";h",
        snippetType = "autosnippet",
    }, {
        t("\\eta"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";o",
        snippetType = "autosnippet",
    }, {
        t("\\theta"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";O",
        snippetType = "autosnippet",
    }, {
        t("\\Theta"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";k",
        snippetType = "autosnippet",
    }, {
        t("\\kappa"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";l",
        snippetType = "autosnippet",
    }, {
        t("\\lambda"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";m",
        snippetType = "autosnippet",
    }, {
        t("\\mu"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";n",
        snippetType = "autosnippet",
    }, {
        t("\\nu"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";x",
        snippetType = "autosnippet",
    }, {
        t("\\xi"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";i",
        snippetType = "autosnippet",
    }, {
        t("\\pi"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";I",
        snippetType = "autosnippet",
    }, {
        t("\\Pi"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";r",
        snippetType = "autosnippet",
    }, {
        t("\\rho"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";s",
        snippetType = "autosnippet",
    }, {
        t("\\sigma"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";S",
        snippetType = "autosnippet",
    }, {
        t("\\Sigma"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";t",
        snippetType = "autosnippet",
    }, {
        t("\\tau"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";f",
        snippetType = "autosnippet",
    }, {
        t("\\phi"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";F",
        snippetType = "autosnippet",
    }, {
        t("\\Phi"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";p",
        snippetType = "autosnippet",
    }, {
        t("\\psi"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";P",
        snippetType = "autosnippet",
    }, {
        t("\\Psi"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";w",
        snippetType = "autosnippet",
    }, {
        t("\\omega"),
    }, {
        condition = in_math,
    }),
    s({
        trig = ";W",
        snippetType = "autosnippet",
    }, {
        t("\\Omega"),
    }, {
        condition = in_math,
    }),
    s({
        trig = "NN",
        snippetType = "autosnippet",
    }, {
        t("\\mathbb{N}"),
    }, {
        condition = in_math,
    }),
    s({
        trig = "ZZ",
        snippetType = "autosnippet",
    }, {
        t("\\mathbb{Z}"),
    }, {
        condition = in_math,
    }),
    s({
        trig = "QQ",
        snippetType = "autosnippet",
    }, {
        t("\\mathbb{Q}"),
    }, {
        condition = in_math,
    }),
    s({
        trig = "RR",
        snippetType = "autosnippet",
    }, {
        t("\\mathbb{R}"),
    }, {
        condition = in_math,
    }),
    s({
        trig = "CC",
        snippetType = "autosnippet",
    }, {
        t("\\mathbb{C}"),
    }, {
        condition = in_math,
    }),
    s({
        trig = "OO",
        snippetType = "autosnippet",
    }, {
        t("\\mathcal{O}"),
    }, {
        condition = in_math,
    }),
    s({
        trig = "FF",
        snippetType = "autosnippet",
    }, {
        t("\\mathcal{F}"),
    }, {
        condition = in_math,
    }),
    s({
        trig = "oo",
        snippetType = "autosnippet",
    }, {
        t("\\infty"),
    }, {
        condition = in_math,
    }),
    s({
        trig = "sbs",
        snippetType = "autosnippet",
    }, {
        t("\\subseteq"),
    }, {
        condition = in_math,
    }),
}
