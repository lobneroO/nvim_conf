local dap = require('dap')

local function is_windows()
    return GetOS and GetOS() == "Windows"
end

dap.configurations.cpp = {
    {
        name = "Launch",
        type = is_windows() and "cppvsdbg" or "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        args = {},
    },
}
