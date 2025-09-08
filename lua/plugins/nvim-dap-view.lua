-- less cluttered alternative to nvim-dap-ui.
-- in the end, it may be better to just customize with nvim-dap widgets,
-- e.g. shown here https://www.reddit.com/media?url=https%3A%2F%2Fpreview.redd.it%2Fshare-your-dap-ui-layouts-looking-for-inspiration-v0-0cwtyzfv776e1.png%3Fwidth%3D2880%26auto%3Dwebp%26s%3D618d1b2a102ec8feb7520e89a07fda2bc313c461
-- and implemente at https://github.com/rezhaTanuharja/minimalistNVIM/blob/main/lua/plugins/nvim-dap.lua 
return {
    "igorlfs/nvim-dap-view",
    ---@module 'dap-view'
    ---@type dapview.Config
    -- keys = {
    --     { "<C-Q>", "<cmd>DapViewClose!<cr>", desc = "Quit Debugging, close Debugging UI including DAP Terminal."},
    -- },
    opts = {
        auto_toggle = true,
    },
    config = function(_, opts)
        require("dap-view").setup(opts)

        vim.keymap.set('n', '<C-q>', function()
            -- if dap-view is running, nvim-dap must be running. 
            -- we can savely assume this require returns something.
            require('dap').terminate()
            vim.cmd("DapViewClose!")
        end)
    end
}
