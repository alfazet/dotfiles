function initUi()
    app.registerUi({ ["callback"] = "selectionRect", ["accelerator"] = "s" });
    app.registerUi({ ["callback"] = "undo", ["accelerator"] = "u" });
    app.registerUi({ ["callback"] = "redo", ["accelerator"] = "<Control>r" });
    app.registerUi({ ["callback"] = "copy", ["accelerator"] = "y" });
    app.registerUi({ ["callback"] = "paste", ["accelerator"] = "p" });
    app.registerUi({ ["callback"] = "cut", ["accelerator"] = "d" });
    app.registerUi({ ["callback"] = "drawFreehand", ["accelerator"] = "x" });
    app.registerUi({ ["callback"] = "drawSpline", ["accelerator"] = "b" });
    app.registerUi({ ["callback"] = "drawRect", ["accelerator"] = "r" });
    app.registerUi({ ["callback"] = "drawEllipse", ["accelerator"] = "e" });
end

function selectionRect()
    app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_RECT" })
end

function undo()
    app.uiAction({ ["action"] = "ACTION_UNDO" })
end

function redo()
    app.uiAction({ ["action"] = "ACTION_REDO" })
end

function copy()
    app.uiAction({ ["action"] = "ACTION_COPY" })
end

function paste()
    app.uiAction({ ["action"] = "ACTION_PASTE" })
end

function cut()
    app.uiAction({ ["action"] = "ACTION_CUT" })
end

function drawFreehand()
    app.uiAction({ ["action"] = "ACTION_TOOL_PEN" })
end

function drawSpline()
    drawFreehand()
    app.uiAction({ ["action"] = "ACTION_TOOL_DRAW_SPLINE" })
end

function drawRect()
    drawFreehand()
    app.uiAction({ ["action"] = "ACTION_TOOL_DRAW_RECT" })
end

function drawEllipse()
    drawFreehand()
    app.uiAction({ ["action"] = "ACTION_TOOL_DRAW_ELLIPSE" })
end
