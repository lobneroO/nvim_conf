-- install plugin for code folding

return {
	"kevinhwang91/nvim-ufo",
	event = "BufRead",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		-- default settings to enable
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- setup folding source: first lsp, then indent as fallback
        -- Tell the server the capability of foldingRange,
        -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
        local language_servers = vim.lsp.get_clients()
        for _, ls in ipairs(language_servers) do
            require('lspconfig')[ls].setup({
                capabilities = capabilities
                -- you can add other fields for setting up lsp server in this table
            })
        end
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { 'lsp', 'indent' }
     			end
   		})

		-- remap keys for "fold all" and "unfold all"
   		vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "Open all folds" })
   		vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "Close all folds" })
	end,
}

