-- contains key remappings for easier usage
vim.g.mapleader = " " -- leader key can be used by many plugins for key mappings
-- default key to open "file browser" is :Ex in normal mode.
-- remap this to, while in normal mode (-> "n"), to <leader>pv
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
