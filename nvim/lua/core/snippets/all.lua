local helpers = require("core.snippets.helper-functions")
local get_visual = helpers.get_visual

function line_begin_or_non_letter(line_to_cursor, matched_trigger)
    local line_begin = line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
    local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match('[ :`=%{%(%["]')
    return line_begin or non_letter
end

return {

}
