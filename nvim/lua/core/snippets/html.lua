return {
    -- Span with margin for monospace font or TeX.
    s({trig = ";ss", snippetType = "autosnippet"},
    fmt(
    [[
    {}<span class="mx-1">{}</span>
    ]],
    {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
    }
    )
    ),
}
