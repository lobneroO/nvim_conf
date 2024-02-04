-- enable line numbers (absolute, because we're not savages here)
vim.wo.number = true

-- share the clipboard with the system
vim.opt.clipboard = 'unnamedplus'

-- use 4 spaces for tabs
vim.opt.tabstop = 4
vim.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- disable line wraps
vim.opt.wrap = false

-- increase the search highlighting experience
vim.opt.incsearch = true

-- something something "good colours"
vim.opt.termguicolors = true

-- never have less than 8 lines towards the top/bottom (unless end of file)
vim.opt.scrolloff = 8
-- populate the sign column with useful info (tbh I don't see a difference atm)
vim.opt.signcolumn = "yes"


-- use external color scheme catppucin light theme, installed in lua/plugins/catppuccin.lua
vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()

vim.cmd [[colorscheme catppuccin]]
