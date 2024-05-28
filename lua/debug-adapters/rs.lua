
local dap = require('dap')
<<<<<<< HEAD
=======
-- dap.adapters.rust_gdb = {
--     type = "executable",
--     command = "rust-gdb",
--     args = { "-i", "dap" }
-- }
--
-- debugging with rust needs to have the port set.
>>>>>>> 865d062 (removed rust manual setup, replaced with rustaceanvim and manually installed rust-analyzer. works better on windows.)

local cmd_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/"
if GetOS() == "Windows" then
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

        -- possibly needed for windows:
        detached = false,
    },
}
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
<<<<<<< HEAD
=======


>>>>>>> 865d062 (removed rust manual setup, replaced with rustaceanvim and manually installed rust-analyzer. works better on windows.)
