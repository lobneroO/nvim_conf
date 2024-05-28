
local dap = require('dap')
-- dap.adapters.rust_gdb = {
--     type = "executable",
--     command = "rust-gdb",
--     args = { "-i", "dap" }
-- }
--
-- debugging with rust needs to have the port set.

dap.configurations.rust = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path. to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
}


