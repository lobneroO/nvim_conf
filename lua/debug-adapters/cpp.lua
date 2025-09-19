local dap = require('dap')

local function is_windows()
    return GetOS and GetOS() == "Windows"
end

dap.configurations.cpp = {
    {
        name = "Launch (No Stop on Entry)",
        type = is_windows() and "cppvsdbg" or "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,  -- Changed from true to false
        args = {},
        console = "integratedTerminal",
        environment = {},
        externalConsole = false,
    },
    {
        name = "Launch (External Console)",
        type = is_windows() and "cppvsdbg" or "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        console = "externalTerminal",  -- Use external console
        environment = {},
        externalConsole = true,
    },
    {
        name = "Launch (Debug Build)",
        type = is_windows() and "cppvsdbg" or "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        console = "integratedTerminal",
        environment = {},
        externalConsole = false,
        -- Additional options for better compatibility
        setupCommands = is_windows() and {} or {
            {
                description = "Enable pretty-printing for gdb",
                text = "-enable-pretty-printing",
                ignoreFailures = true
            }
        },
    },
    {
        name = "Launch (Stop at main)",
        type = is_windows() and "cppvsdbg" or "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        console = "integratedTerminal",
        environment = {},
        externalConsole = false,
        -- Set breakpoint at main instead of stopping on entry
        preLaunchTask = nil,
        postDebugTask = nil,
    },
    {
        name = "Attach to Process",
        type = is_windows() and "cppvsdbg" or "lldb",
        request = "attach",
        processId = function()
            return require('dap.utils').pick_process()
        end,
        cwd = "${workspaceFolder}",
    },
}

-- Also configure for C files
dap.configurations.c = dap.configurations.cpp
