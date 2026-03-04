-- install plugin for diff and merge views
-- this is a fork of the original diffview, as that seems to not be maintained anylonger.
-- original at https://github.com/sindrets/diffview.nvim

return {
	"dlyongemallo/diffview.nvim",
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
			end,
			{ desc = "Toggle diffview on/off" }
		)

        -- file history (no toggle available)
        vim.keymap.set('n',
            '<leader>dh', '<cmd>DiffviewFileHistory %<cr>',
            { desc = "Open file history for current file" }
        )
        vim.keymap.set('n',
            '<leader>dH', '<cmd>DiffviewFileHistory<cr>',
            { desc = "Open file history for the entire repo" }
        )
        -- file history for selection
        vim.keymap.set('n',
            '<leader>dh', "<Esc><cmd>'<,'>DiffviewFileHistory --follow<cr>",
            { desc = "Open file history for selection" }
        )
        
        -- diff against main/master
        vim.keymap.set('n', '<leader>dm', function()
            -- try main first, fall back to master
            local handle = io.popen('git rev-parse --verify main 2>/dev/null')
            local result = handle:read('*a')
            handle:close()
            local branch = result ~= '' and 'main' or 'master'
            vim.cmd('Diffview Open' .. branch)
        end, { desc = "Diff against main/master" })
	end,
}

