return {
    "lervag/vimtex",
    ft = { "tex" },
    lazy = false,
    config = function()
        vim.g.tex_fast = ""
        vim.g.vimtex_syntax_enabled = 1
        vim.g.vimtex_view_method = "zathura"
        vim.g.latex_view_general_viewer = "zathura"
        vim.g.vimtex_log_verbose = 1
        vim.g.vimtex_view_automatic = 0
        vim.g.vimtex_view_forward_search_on_start = 0
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_compiler_silent = 1
        vim.g.vimtex_compiler_latexmk = {
            ["continuous"] = 0,
        }
    end
}
