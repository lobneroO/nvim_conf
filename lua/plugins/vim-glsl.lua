-- the glsl_analyzer lsp doesn't come with syntax highlighting
-- therefore add this additional plugin to fill that gap
return {
	"tikhomirov/vim-glsl",
	-- the file types are not correctly recognized,
	-- e.g. .vert doesn't work although it should.
	-- set them manually
	config = function()
		vim.api.nvim_create_autocmd(
			{ "BufRead", "BufNewFile" },
			{
				pattern = {
					"*.vert", "*.frag", "*.tesc",
					"*.tese", "*.geom", "*comp",
					"*.rgen", "*.rchit", "*.rahit",
					"*.rmiss"
				},
				command = "set filetype=glsl"
			}
		)
	end,
}
