return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			-- languages to install
			ensure_installed = {
				"c", "cpp",
				"hlsl", "glsl", "wgsl",
				"java",
				"lua", "vim", --"help",
				"javascript", "html", "json", "xml", "yaml",
				"rust", "toml",
				"python",
				"make", "cmake",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
