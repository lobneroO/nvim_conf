return {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	-- add some key mappings to access the telescope functionalities
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find file" })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find in buffers" })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Key Maps" })
		vim.keymap.set('n', '<leader>fp', builtin.git_files, { desc = "Find files in git repository" })
		vim.keymap.set('n', '<leader>fw',
			function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end, { desc = "Find files in git repository" })
	end,
}

