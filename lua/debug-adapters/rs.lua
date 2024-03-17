
local dap = require('dap')
dap.adapters.rust_gdb = {
    type = "executable",
    command = "rust-gdb",
    args = { "-i", "dap" }
}

dap.configurations.rust = {
    {
        name = "Launch",
        type = "rust_gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path. to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
}

