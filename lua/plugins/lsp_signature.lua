-- plugin to keep the hover while typing function parameters
-- (lsp-zero only shows them until you start typing a function parameter,
-- then closes the hover, so you have to remember which parameters come next
-- while typing)
return
{
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		require('lsp_signature').setup(opts)

		-- toggle floating window.
		-- make sure this is available in both
		-- normal and insert mode!
		vim.keymap.set({'n', 'i'}, '<C-K>',
			function()
				require('lsp_signature').toggle_float_win()
			end,
			{
				desc = "Toggle floating signature window",
				silent = true,
				noremap = true
			}
		)
	end,
}
