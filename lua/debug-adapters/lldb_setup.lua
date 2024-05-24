
local dap = require('dap')

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
