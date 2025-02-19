local utils = require("core.snippets.snippet_utils")
local s = utils.s
local t = utils.t
local in_math = utils.in_math

return {
    s({
            trig = ";a",
            snippetType = "autosnippet",
        },
        {
            t("\\alpha")
        },
        {
            condition = in_math
        })
}
