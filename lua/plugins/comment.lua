return 
{
	'numToStr/Comment.nvim',
	opts = {
		-- any options here
	},
	lazy = false,
	config = function()
		require('Comment').setup({
			-- LHS of toggle mappings in normal mode
			toggler = {
				-- line-comment toggle keymap
				line = '<leader>cc',
				-- block-comment toggle keymap
				block = '<leader>bc'
			},
			-- LHS of operator-pending mappings in normal and visual mode
			opleader = {
				line = '<leader>cc',
				block = '<leader>bc'
			}
		})
	end
}
