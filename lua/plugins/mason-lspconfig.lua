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
                "omnisharp",
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

    end,
}
