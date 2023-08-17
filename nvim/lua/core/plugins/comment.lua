return {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
        require("Comment").setup({
            toggler = {
                line = "gll",
                block = "gbb",
            },
            opleader = {
                line = "gl",
                block = "gb",
            },
            extra = {
                above = "glO",
                below = "glo",
                eol = "glA",
            },
        })
    end,
}
