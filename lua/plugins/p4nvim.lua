 -- return {
 --    'motiongorilla/p4nvim',
 --
	-- config = function()
 --         -- require("p4nvim").setup()
 --         vim.keymap.set("n", "<leader>p4a", ":P4Add<CR>", { noremap = true, silent = true })
 --         vim.keymap.set("n", "<leader>p4e", ":P4Checkout<CR>", { noremap = true, silent = true })
 --         vim.keymap.set("n", "<leader>p4r", ":P4Revert<CR>", { noremap = true, silent = true })
 --         vim.keymap.set("n", "<leader>p4t", ":P4CheckedInTelescope<CR>", { noremap = true, silent = true })
 --
 --         vim.api.nvim_set_keymap('n', '<leader>pm', ':P4MoveRename<CR>', { noremap = true, silent = true })
 --         vim.api.nvim_set_keymap('n', '<leader>pg', ':P4GetFileCL<CR>', { noremap = true, silent = true })
 --         vim.api.nvim_set_keymap('n', '<leader>ph', ':P4ShowFileHistory<CR>', { noremap = true, silent = true })
 --         vim.api.nvim_set_keymap('n', '<leader>pl', ':P4MoveToChangelist<CR>', { noremap = true, silent = true })
 --         vim.api.nvim_set_keymap('n', '<leader>pd', ':P4DeleteChangelist<CR>', { noremap = true, silent = true })
 --         vim.api.nvim_set_keymap('n', '<leader>ps', ':P4ShowCheckedOut<CR>', { noremap = true, silent = true })
 --         vim.api.nvim_set_keymap('n', '<leader>pc', ':P4CLList<CR>', { noremap = true, silent = true })
 --    end,
 -- }

 return {
     'rmccord7/p4.nvim',
     dependencies = {
         'nvim-neotest/nvim-nio',
         'nvim-telescope/telescope.nvim',
         {
             "ColinKennedy/mega.cmdparse",
             dependencies = { "ColinKennedy/mega.logging" },
             version = "v1.*",
         },
         opts = {
             -- your configuration comes here
             -- or leave it empty to use the default settings
             -- refer to the configuration section below
         },
     }
}

