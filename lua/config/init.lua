-- load the remap.lua file in the nvim/lua/config folder (i.e. search from the root, not from "here" locally)
require("config.remap")

-- bootstrap lazy.nvim as a plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- actually add lazy to nvim
require("lazy").setup("plugins")

-- load the editor.lua file from nvim/lua/config for general (n)vim settings like line numbers
require("config.editor")

-- load the init.lua file from nvim/lua/dap for all the dap server configs
require("debug-adapters.init")
-- require("dap.cpp")
-- load all DAP files
-- TODO: move these to own file. just for testing
-- local dap = require('dap')
-- dap.adapters.gdb = {
--     type = "executable",
--     command = "gdb",
--     args = { "-i", "dap" }
-- }
--
-- dap.configurations.c = {
--     {
--         name = "Launch",
--         type = "gdb",
--         request = "launch",
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = "${workspaceFolder}",
--         stopAtBeginningOfMainSubprogram = false,
--     },
-- }
-- dap.configurations.cpp = {
--     {
--         name = "Launch",
--         type = "gdb",
--         request = "launch",
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = "${workspaceFolder}",
--         stopAtBeginningOfMainSubprogram = true,
--     },
-- }

