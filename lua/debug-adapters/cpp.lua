
local dap = require('dap')

-- dap.configurations.cpp = {
--     {
--         name = "Launch",
--         type = "lldb",
--         request = "launch",
--         program = function()
--             return vim.fn.input('Path. to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = "${workspaceFolder}",
--         stopAtBeginningOfMainSubprogram = false,
--     },
-- }

dap.adapters.cdbdap = {
    type = 'server',
    host = '127.0.0.1',
    port = 13000
}


-- local argInput
dap.configurations.cpp = {
    {
        name = "Launch with cdbdap",
        type = "cdbdap",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        -- args = {},
        args = function()
            local arguments = vim.fn.input('Arguments: ', '', 'arglist')
            return vim.split(arguments, " ", { trimempty = true })
        end,
    }
}
