-- add plugin to toggle diagnostics on / off
-- this is mostly used for diffview, where 
-- opening diffs for c++ projects won't get any compile commands,
-- thus all the includes are missing and the defines are off

return {
	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",

	config = function()
		require("toggle_lsp_diagnostics").init()

		vim.keymap.set('n', '<leader>di',
			function()
				vim.cmd('ToggleDiag')
			end,
			{ desc = "Toggle Diagnostics on/off" }
		)
	end
}
