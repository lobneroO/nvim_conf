-- plugin for displaying git blame info
return {
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
        require('blame').setup()

        -- setup a sensible shortcut
		vim.keymap.set("n", "<leader>gb", "<CMD>BlameToggle<CR>", { desc = "Toggle Git Blame" })
    end,
}
