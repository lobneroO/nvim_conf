-- install plugin for workspace support (similar to vsc)

return {
	"Dax89/automaton.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap", -- Debug support for 'launch' configurations (Optional)
		"hrsh7th/nvim-cmp",      -- Autocompletion for automaton workspace files (Optional)
		"L3MON4D3/LuaSnip",      -- Snippet support for automaton workspace files (Optional)
	},


	config = function()
        require("automaton").setup({})
		-- keymappings for setup and call

		vim.keymap.set("n", "<leader>wC", "<CMD>Automaton create<CR>", { desc = "Create workspace" })
		vim.keymap.set("n", "<leader>wI", "<CMD>Automaton init<CR>", { desc = "Init workspace" })
		vim.keymap.set("n", "<leader>wL", "<CMD>Automaton load<CR>", { desc = "Load workspace" })

		vim.keymap.set("n", "<leader>wc", "<CMD>Automaton config<CR>", { desc = "Workspace config" })
        vim.keymap.set("n", "<leader>wr", "<CMD>Automaton recents<CR>")
        vim.keymap.set("n", "<leader>ww", "<CMD>Automaton workspaces<CR>")
        vim.keymap.set("n", "<leader>wj", "<CMD>Automaton jobs<CR>")
        vim.keymap.set("n", "<leader>wl", "<CMD>Automaton launch<CR>")
        vim.keymap.set("n", "<leader>wd", "<CMD>Automaton debug<CR>")
        vim.keymap.set("n", "<leader>wt", "<CMD>Automaton tasks<CR>")
	end,
}
