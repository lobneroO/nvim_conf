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
			lsp_zero.default_keymaps({
				buffer = bufnr,

				-- whichkey is overwriting lsp-zero shortcuts (like gd, gD)
				-- therefore force them here
				preserve_mappings = false
			})
		end)

		-- make sure lsp_signature attaches
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if vim.tbl_contains({ 'null-ls'}, client.name) then -- blacklist lsp
					return
				end

				require("lsp_signature").on_attach({
					-- set up options here
				}, bufnr)
			end,
		})

		-- default keymap for opening float is K.
		-- go to next / previous diagnostic. important especially,
		-- if multiple diagnostics appear on one line
		vim.keymap.set('n', '<leader>.',
			function()
				vim.diagnostic.goto_next()
			end, { desc = "Go to next diagnostic"})
		vim.keymap.set('n', '<leader>,',
			function()
				vim.diagnostic.goto_prev()
			end, { desc = "Go to previous diagnostic"})
        -- need to get type information for the symbol (i.e. usually variable)
        -- under the cursor
        vim.keymap.set('n', '<leader>ga',
            function()
                vim.lsp.buf.hover()
            end, { desc = "Display type information of the element under cursor"} )
        -- sometimes code actions are available (such as adding an import)
        -- the following shortcut will open these
        vim.keymap.set('n', '<leader>ca',
            function()
                vim.lsp.buf.code_action()
            end, { desc = "Open coda actions"})
        -- renaming based on LSP for refactoring a variable or function name
        -- is way more efficient than :%s/name1/name2/g ...
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = "LSP rename"})


		-- setup mason for lsp installation from within nvim
		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = {
				"clangd", "cmake",
				"glsl_analyzer",
				"lua_ls",
				"pylsp",
				"ltex", -- includes LaTeX and markdown
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
		require('lspconfig').glsl_analyzer.setup({
			filetypes = {
				"glsl", "vert", "frag", "tesc", "tese", "geom", "comp",
				"rchit", "rmiss", "rahit", "rgen"
			}
		})
		require('lspconfig').pylsp.setup({
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							ignore={
								-- ignore warning about incorrect indent when continuing on new line
								-- this is ignored, because having to continue more than one indent further
								-- in is stupid. whoever came up with that shitty idea?
								-- i.e. use:
								-- long_line(first_param,
								--     second_param)
								-- rather than
								-- long_line(first_param,
								--           second_param)
								'E128',
								-- ignore 'line break before binary operator'. seriously,
								-- who comes up with rules this shitty? plus, breaking after
								-- is disapproved of as well. what do they want me to do? morons
								'W503'
							}
						}
					}
				}
			}
		})
	end,
}

