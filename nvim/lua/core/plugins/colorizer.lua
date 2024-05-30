return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({
            "css";
            "scss";
            "html";
            "javascript";
        }, {
            names = false
        })
    end,
}
