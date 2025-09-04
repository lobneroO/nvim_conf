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

-- vscode light theme
vim.o.background = 'light'
local c = require('vscode.colors').get_colors()
require('vscode').setup({
    style = 'light',

    -- enable transparent background
    -- transparent = true,

    -- enable italic comments
    italic_comments = true,

    -- underline `@markup.link.*` variants
    underline_links = true,

    -- disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- override colors
    -- color_overrides = {
    --     vscLineNumber = '#098658',
    -- },

    -- override highlight groups
    group_overrides = {
        -- supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
-- load theme without affecting devicon colors
vim.cmd.colorscheme "vscode"

-- use external color scheme catppucin light theme, installed in lua/plugins/catppuccin.lua
-- vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha

-- cattpuccin light color scheme
-- require("catppuccin").setup()
--
-- vim.cmd [[colorscheme catppuccin]]

-- highlight yanking
-- e.g. yy -> highlights line. yap -> highlights the paragraph around the cursor.
--  either way, highlighted text is yanked and can be pasted.
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- as suggested by checkhealth (it was complaining about lack of localoptions):
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

