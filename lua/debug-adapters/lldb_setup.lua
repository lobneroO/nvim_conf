local dap = require('dap')

local function is_windows()
    return GetOS and GetOS() == "Windows"
end

-- LLDB setup
local cmd_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/"
if is_windows() then
    cmd_path = cmd_path .. "codelldb.exe"
else
    cmd_path = cmd_path .."codelldb"
end

dap.adapters.lldb = {
    type = 'server',
    host = '127.0.0.1',
    port = 13000,
    executable = {
        command = cmd_path,
        args = {"--port", "13000"},
        detached = false,
    },
}

-- cppvsdbg setup for Windows
if is_windows() then
    dap.adapters.cppvsdbg = {
        id = 'cppvsdbg',
        type = 'executable',
        command = 'C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/IDE/Extensions/Microsoft/Debugger/cppvsdbg.exe',
        options = {
            detached = false
        }
    }
end

-- Example configuration for C++
-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = is_windows() and "cppvsdbg" or "lldb",
--         request = "launch",
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = true,
--         args = {},
--     },
-- }
