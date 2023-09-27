return {
    "lervag/vimtex",
    ft = {"tex"},
    config = function()
        vim.cmd([[let maplocalleader = ' ']])
        vim.cmd([[let g:tex_fast = ""]])
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_log_verbose = 1
        vim.g.vimtex_view_forward_search_on_start = 0
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g.vimtex_compiler_latexmk = {
            ["continuous"] = 0,
            ["options"] = {
                "-pdf",
                "-verbose",
                "-file-line-error",
                "-halt-on-error",
                "-interaction=nonstopmode",
            }
        }
    end
}
