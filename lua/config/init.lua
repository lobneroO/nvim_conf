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
