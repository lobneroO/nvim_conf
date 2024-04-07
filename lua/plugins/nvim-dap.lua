
-- nvim-dap adds Debug Adapter Protocol capabilities to nvim
-- NOTE: this is the CLIENT, not the server. You have to set up a server per language
return {
    "mfussenegger/nvim-dap",

    -- set up key maps for debugger (basically standard mappings for VS C++)
    config = function()
        -- use F5 to start debugging and as a continue.
        -- NOTE: this is handeled by automation plugin!
        -- nvim-dap-ui will listen to dap opening a debug sessions automatically open
        -- vim.keymap.set('n', '<F5>', function() require'dap'.continue() end)
        vim.keymap.set('n', '<F10>', function() require'dap'.step_over() end)
        vim.keymap.set('n', '<F11>', function() require'dap'.step_into() end)
        -- shift+F11 for set out, like VS has it standard for C++
        vim.keymap.set('n', '<S-F11>', function() require'dap'.step_out() end)
        -- open debugger on Ctrl+F5 without starting debugging
        vim.keymap.set('n', '<C-F5>', function() require'dap'.repl.open() end)
        -- use ctrl+q for closing the debug session and debugger.
        -- again, nvim-dap-ui will listen for this and close the ui
        vim.keymap.set('n', '<C-q>', function()
            require'dap'.terminate()
        end)

        -- additionally: keys to handle breakpoints
        vim.keymap.set('n', '<leader>b', function() require'dap'.toggle_breakpoint() end)
        vim.keymap.set('n', '<leader>B', function()
            require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
        vim.keymap.set('n', '<leader><C-B>', function()
            require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    end
}
