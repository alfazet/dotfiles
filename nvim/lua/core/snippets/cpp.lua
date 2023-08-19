return {
    -- commonly used header in competitive programming 
    s({trig = ";head", snippetType = "autosnippet"},
    fmt(
    [[
    #include <iostream>
    #include <algorithm>
    #include <vector>
    #include <stack>
    #include <queue>
    #include <set>
    #include <map>
    #include <utility>

    using namespace std;
    typedef long long int lli;
    ]],
    {
    }
    )
    ),

    -- main function template
    s({trig = ";main", snippetType = "autosnippet"},
    fmt(
    [[
    int main(){
        <>

        return 0;
    }
    ]],
    {
        i(1),
    },
    {
        delimiters = "<>",
    }
    )
    ),

    -- fast io using cin/cout
    s({trig = ";fastio", snippetType = "autosnippet"},
    fmt(
    [[
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    ]],
    {
    }
    )
    ),
}
