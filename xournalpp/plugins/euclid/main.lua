function initUi()
    app.registerUi({ ["callback"] = "drawSegments", ["accelerator"] = "<Alt>s" });
end

function getPoints(n)
    local handle = io.open("/tmp/mouse.log", "r")
    local lines = {}
    for line in handle:lines() do
        table.insert(lines, line)
    end
    handle:close()

    local cnt_lines = #lines
    local points = {}
    for i, line in ipairs(lines) do
        if cnt_lines - i <= n - 1 then
            local x, y = string.match(line, "(%d+) (%d+)")
            table.insert(points, { ["x"] = x, ["y"] = y })
        end
    end

    return points
end

-- multiply a 3x3 matrix a by a 3x1 vector v, returns only x and y since we don't care about the z coord here
function mmul(a, v)
    local res_x = a[1][1] * v[1] + a[1][2] * v[2] + a[1][3] * v[3]
    local res_y = a[2][1] * v[1] + a[2][2] * v[2] + a[2][3] * v[3]

    return { ["x"] = res_x, ["y"] = res_y }
end

-- map points from "screen space" to "Xournal space"
-- (40, 44)_screen = (0, 0)_xournal
-- (2520, 0)_screen = (595, 0)_xournal
-- (0, 2520)_screen = (0, 595)_xournal
function mapPoints(points)
    local coeffs = {
        ["a1"] = 10815 / 44992,
        ["a2"] = 175 / 44992,
        ["a3"] = 385 / 89984,
        ["a4"] = 21665 / 89984,
        ["b1"] = -2975 / 304,
        ["b2"] = -6545 / 608
    }
    local new_points = {}
    for _, point in ipairs(points) do
        local new_point = mmul({ { coeffs.a1, coeffs.a2, coeffs.b1 }, { coeffs.a3, coeffs.a4, coeffs.b2 }, { 0, 0, 1 } },
            { point.x, point.y, 1 })
        new_point.y = new_point.y + 20
        table.insert(new_points, new_point)
    end

    return new_points
end

function drawSegments()
    local n = 3
    local points = mapPoints(getPoints(n))
    local x_coords = {}
    local y_coords = {}
    for _, point in ipairs(points) do
        table.insert(x_coords, point.x)
        table.insert(y_coords, point.y)
    end

    app.addStrokes({ ["strokes"] = { { ["x"] = x_coords, ["y"] = y_coords } } })
    app.refreshPage()
end
