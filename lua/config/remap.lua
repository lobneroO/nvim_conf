--dcontains key remappings for easier usage
vim.g.mapleader = " " -- leader key can be used by many plugins for key mappings
-- default key to open "file browser" is :Ex in normal mode.
-- remap this to, while in normal mode (-> "n"), to <leader>pv
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- quit out of a vim search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>sfp",
    function()
        -- %:p expands to absolute path
        local fp = vim.fn.expand('%:p')
        -- nvim_echo interface is a bit clunky. 
        -- the string to echo has to be a chunk (-> {{<string>, None}})
        -- in order to not write this output to log, second param is false
        -- third param is not optional but not needed
        vim.api.nvim_echo({{fp, 'None'}}, false, {})
    end,
    { desc = "show full file path"})
