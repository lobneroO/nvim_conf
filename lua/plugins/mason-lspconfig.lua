return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()
        require("mason-lspconfig").setup {
            ensure_installed = {
				"clangd", "neocmake",
				"glsl_analyzer",
				"lua_ls",
				"pylsp",
				"ltex", -- includes LaTeX and markdown
				-- "rust_analyzer", -- not recommended when using rustaceanvim
                -- "c#" (/"roslyn") installed via mason-tool-installer in mason.lua
            },
            automatic_enable = {
                exclude = { "powershell_es" },
            },
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
        -- there is a recurring issue with nvim spamming a unhandled promise rejection
        -- in the folding ranges, which makes editing a nightmare. supposedly, this
        -- setting helps
        -- (see https://github.com/redhat-developer/yaml-language-server/issues/912
        --  and https://neovim.io/doc/user/lsp.html)
        --  this may be related to the ufo (folding) plugin
        vim.lsp.config("*", {
            capabilities = {
                textDocument = {
                    foldingRange = {
                        dynamicRegistration = false,
                        lineFoldingOnly = true,
                    }
                }
            }
        })

    end,
}
