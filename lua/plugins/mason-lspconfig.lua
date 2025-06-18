return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },

    config = function()
        require("mason-lspconfig").setup {
            ensure_intsalled = {
				"clangd", "cmake",
				"glsl_analyzer",
				"lua_ls",
				"pylsp",
				"ltex", -- includes LaTeX and markdown
				-- "rust_analyzer", -- not recommended when using rustaceanvim
            }
        }

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
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
    end,
}
