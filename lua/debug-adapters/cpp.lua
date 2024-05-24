
local dap = require('dap')
<<<<<<< HEAD

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
=======
if GetOS() == "Unix" then
    dap.adapters.c_dbg = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
    }
elseif GetOS() == "Windows" then
    dap.adapters.c_dbg = {
        type = "executable",
        command = "clang",
        args = { "-i", "dapt" }
    }
end
dap.configurations.c = {
    {
        name = "Launch",
        type = "c_dbg",
>>>>>>> 135aa05ce62c0786ac0603fb010f42f2147b3ed1
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
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "c_dbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = true,
    },
}
>>>>>>> 135aa05ce62c0786ac0603fb010f42f2147b3ed1
