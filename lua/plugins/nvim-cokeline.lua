-- add a tab line with status information like errors and save status

return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim",        -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
		"stevearc/resession.nvim"       -- Optional, for persistent history
	},
	config = function()
		require("cokeline").setup({})

		local map = vim.api.nvim_set_keymap

		map("n", "<C-h>", "<Plug>(cokeline-focus-prev)", { desc = "Previous Buffer", silent = true})
		map("n", "<C-l>", "<Plug>(cokeline-focus-next)", { desc = "Next Buffer", silent = true})
		map("n", "<A-h>", "<Plug>(cokeline-switch-prev)", { desc = "Move Buffer left", silent = true})
		map("n", "<A-l>", "<Plug>(cokeline-switch-next)", { desc = "Move Buffer right", silent = true})
	end,
}

