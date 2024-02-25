-- mason takes care of some installations for LSP, but cannot handle DAP
-- directly. therefore use mson-dap to close that gap

return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
    },

    config = function()
        require('mason-nvim-dap').setup({
            ensure_installed = {
                "cppdbg",
            }
        })
    end
}

