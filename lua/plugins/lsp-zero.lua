return {
	'VonHeikemen/lsp-zero.nvim', bracnh = 'v3.x',
	dependencies = {
		-- mason for installation of LSPs from within nvim
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
		-- actual dependencies
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		-- nvim-cmp as the auto-completeion feature
		{'hrsh7th/nvim-cmp'},
		{'L3MON4D3/LuaSnip'},
	},

	-- do some default setup
	config = function()
		-- setup lsp for files for which you have an LSP
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
		-- see :help lsp-zero-keybindings
		-- to learn the available actions
			lsp_zero.default_keymaps({buffer = bufnr})
		end)

		-- default keymap for opening float is K.
		-- default keymap for going to definition (gd)
		-- or going to declaration (gD) don't work :(
		-- go to next / previous diagnostic. important especially,
		-- if multiple diagnostics appear on one line
		vim.keymap.set('n', '<leader>.',
			function()
				vim.diagnostic.goto_next()
			end, { desc = "Go to next diagnostic"})
		vim.keymap.set('n', '<leader>,',
			function()
				vim.diagnostic.goto_prev()
			end, { desc = "Go toprevious diagnostic"})

		-- setup mason for lsp installation from within nvim
		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = {
				"clangd", "cmake",
				"lua_ls",
				"pylsp",
				-- "rust_analyzer", -- not recommended when using rustaceanvim
			},
			handlers = {
				lsp_zero.default_setup,
			},
		})

		-- 'vim' is global, but LSP doesn't know about it yet.
		require('lspconfig').lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = {
							'vim',
						}
					}
				}
			}
		})

		-- additionally setup the "ensure_installed" languages
		require('lspconfig').clangd.setup({})
		require('lspconfig').cmake.setup({})
		require('lspconfig').pylsp.setup({})
		-- require('lspconfig').rust_analyzer.setup({})
	end,
}

