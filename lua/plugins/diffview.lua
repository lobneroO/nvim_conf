-- install plugin for diff and merge views

return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("diffview").setup()

		-- keys for opening and closing diff view
		-- local df = require('diffview.config')
		vim.keymap.set('n', '<leader>dv',
			function()
				if next(require("diffview.lib").views) == nil then
					vim.cmd('DiffviewOpen')
				else
					vim.cmd('DiffviewClose')
				end
			end
		)
	end,
}

