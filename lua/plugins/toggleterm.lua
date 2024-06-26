-- plugin to toggle a terminal

return {
	'akinsho/toggleterm.nvim', version = "*", 
	config = function()
		require("toggleterm").setup({
			-- keybinding to open the terminal
			open_mapping = [[<c-t>]],
		})

		-- keybindings for when terminal is open
		local opts = {buffer = 0}
		vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
		vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
		vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
		vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
	end,
}

