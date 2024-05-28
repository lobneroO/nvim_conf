-- glow is a plugin for markdown previews in terminal (i.e. in nvim)

return
{
	'ellisonleao/glow.nvim',
	config = function()
		require("glow").setup()
		vim.keymap.set('n', '<C-m>', [[<Cmd>Glow<CR>]], { desc = "Open Markdown Preview"})
	end,
	cmd = "Glow",
}
