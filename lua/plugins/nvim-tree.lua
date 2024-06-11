-- disable netrw at the very start of your init.lua
-- (this was suggested in the repo's setup,
-- netrw is the build in file explorer)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("nvim-tree").setup ({
            view = {
                width = 30,
            },
            filters = {
                dotfiles = true,
            },
        })

        local api = require("nvim-tree.api")
        vim.keymap.set('n', "<C-p>", api.tree.toggle, { desc = "Toggle file tree" })
        vim.keymap.set('n', "<C-i>", api.tree.focus, { desc = "Focus file tree" })
        vim.keymap.set('n', "<A-b>", api.tree.toggle_hidden_filter, { desc = "Toggle hidden filter" })
        vim.keymap.set('n', "<C-f>", api.tree.change_root_to_node, { desc = "Change root to node" })
    end,
}

