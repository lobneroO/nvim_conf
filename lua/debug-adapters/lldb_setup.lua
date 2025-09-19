local dap = require('dap')

local function is_windows()
    return GetOS and GetOS() == "Windows"
end

-- LLDB setup for Linux/Unix
if not is_windows() then
    local cmd_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
    
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
end

-- Microsoft debugger setup for Windows (avoiding VS Code licensing)
if is_windows() then
    -- Try to find Microsoft debugger from various sources (not VS Code)
    local possible_msvc_paths = {
        -- Remote Tools for Visual Studio installation
        'C:/Program Files (x86)/Microsoft Visual Studio/Shared/VSDbg/vs2022/vsdbg.exe',
        'C:/Program Files/Microsoft Visual Studio/Shared/VSDbg/vs2022/vsdbg.exe',
        -- Build Tools installation
        'C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/Common7/IDE/CommonExtensions/Microsoft/MDD/Debugger/vsdbg.exe',
        'C:/Program Files/Microsoft Visual Studio/2022/BuildTools/Common7/IDE/CommonExtensions/Microsoft/MDD/Debugger/vsdbg.exe',
        -- Custom installation path (you can copy vsdbg.exe here)
        'C:/Tools/Microsoft/vsdbg.exe',
    }
    
    local vsdbg_path = nil
    for _, path in ipairs(possible_msvc_paths) do
        if vim.fn.executable(path) == 1 then
            vsdbg_path = path
            break
        end
    end
    
    if vsdbg_path then
        dap.adapters.cppvsdbg = {
            type = 'executable',
            command = vsdbg_path,
            options = {
                detached = false
            },
            -- Add args to improve stability
            args = {}
        }
        print("Using Microsoft debugger at: " .. vsdbg_path)
    else
        -- Fallback to CodeLLDB if no Microsoft debugger found
        print("Microsoft debugger not found, falling back to CodeLLDB")
        print("To get MSVC debugger: Download 'Remote Tools for Visual Studio 2022' from Microsoft")
        
        local cmd_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb.exe"
        
        dap.adapters.cppvsdbg = {
            type = 'server',
            host = '127.0.0.1',
            port = 13001,
            executable = {
                command = cmd_path,
                args = {"--port", "13001"},
                detached = false,
            },
        }
    end
end
