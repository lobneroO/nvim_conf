return {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	-- add some key mappings to access the telescope functionalities
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file"},
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find in buffers"},
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags"},
	},
}
