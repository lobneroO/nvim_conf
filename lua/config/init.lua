-- figure out on which OS this config is used
function GetOS()
    return package.config:sub(1,1) == "\\" and "Windows" or "Unix"
end

-- on Windows in git-bash, the commands cannot be executed with :!<cmd>.
-- to work around this, change the flag that is used to send commands
if GetOS() == "Windows" then
    vim.cmd [[let &shell = '"C:/Program Files/Git/bin/bash.exe"']]
    vim.cmd [[let &shellcmdflag = '-s']]
end

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

