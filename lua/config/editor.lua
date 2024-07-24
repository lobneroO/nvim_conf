-- enable line numbers (absolute, because we're not savages here)
vim.wo.number = true

-- share the clipboard with the system
vim.opt.clipboard = 'unnamedplus'
-- force osc 52 as clipboard provider. available since nvim 0.10.0
-- this will enable yank and paste from an ssh instance to the current
-- desktop (probably not supported on Konsole!)
vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
        ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
        ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
}

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

-- highlight yanking
-- e.g. yy -> highlights line. yap -> highlights the paragraph around the cursor.
--  either way, highlighted text is yanked and can be pasted.
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

