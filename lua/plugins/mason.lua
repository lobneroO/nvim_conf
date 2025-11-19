-- would be okay to use as a dependency of mason-lsp and mason-dap only,
-- but we need to set up registries for roslyn (C#) somewhere...
return {
    "williamboman/mason.nvim",

    config = function()
        require("mason").setup ({
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            }
        })
    end
}
