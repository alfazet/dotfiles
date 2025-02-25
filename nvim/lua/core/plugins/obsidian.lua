return {
    "epwalsh/obsidian.nvim",
    version = "*",
    cond = string.find(vim.fn.getcwd(), vim.fn.expand("~/Sync/vault")) == 1,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "ibhagwan/fzf-lua",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("obsidian").setup({
            preferred_link_style = "wiki",
            workspaces = {
                {
                    name = "vault",
                    path = "~/Sync/vault",
                },
            },
            ui = {
                enable = false,
            },
            completion = {
                min_chars = 0,
            },
            attachments = {
                img_folder = "assets/images",
                confirm_img_paste = false,
                img_text_func = function(client, path)
                    path = client:vault_relative_path(path) or path
                    return string.format("![[%s | center]]", path)
                end
            },
            note_id_func = function(_)
                return require("core.utils").random_hex_id(6)
            end,
            note_frontmatter_func = function(note)
                local out = { id = note.id, tags = note.tags }
                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end
                return out
            end
        })
        vim.keymap.set("n", "<Leader>on", "<Cmd>ObsidianNew<CR>")
        vim.keymap.set("n", "<Leader>ov", function()
            local id = vim.fn.expand("%:r:t")
            vim.cmd("ObsidianOpen " .. id)
        end)
        vim.keymap.set("n", "<Leader>ot", "<Cmd>ObsidianTags<CR>")
        vim.keymap.set("n", "<Leader>og", "<Cmd>ObsidianSearch<CR>")
        vim.keymap.set("n", "<Leader>oi", function()
            local filename = vim.fn.expand("%:r:t") .. "-f" .. require("core.utils").random_hex_id(2)
            vim.cmd("ObsidianPasteImg " .. filename)
        end)
    end
}
