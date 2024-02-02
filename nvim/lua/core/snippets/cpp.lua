local helpers = require("core.snippets.helper-functions")
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({trig = ";template", snippetType="autosnippet"},
      fmta(
        [[
        #include <<iostream>>
        #include <<vector>>
        #include <<set>>
        #include <<map>>
        #include <<utility>>
        #include <<queue>>
        #include <<algorithm>>
        #include <<string>>
        using namespace std;
        typedef long long int lli;

        #define ff first
        #define ss second

        int main() {
            ios_base::sync_with_stdio(false);
            cin.tie(NULL);

            <>

            return 0;
        }
      ]],
        { i(1) }
      ),
      {condition = line_begin}
    ),
}
