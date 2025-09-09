
-- nvim-dap adds Debug Adapter Protocol capabilities to nvim
-- NOTE: this is the CLIENT, not the server. You have to set up a server per language
return {
    "mfussenegger/nvim-dap",

    -- set up key maps for debugger (basically standard mappings for VS C++)
    config = function()
        -- use F5 to start debugging and as a continue.
        -- NOTE: this is handeled by automation plugin!
        -- nvim-dap-ui will listen to dap opening a debug sessions automatically open
        vim.keymap.set('n', '<F5>', function() require'dap'.continue() end)
        vim.keymap.set('n', '<F10>', function() require'dap'.step_over() end)
        vim.keymap.set('n', '<F11>', function() require'dap'.step_into() end)
        -- shift+F11 for set out, like VS has it standard for C++
        vim.keymap.set('n', '<S-F11>', function() require'dap'.step_out() end)
        -- open debugger on Ctrl+F5 without starting debugging
        vim.keymap.set('n', '<C-F5>', function() require'dap'.repl.open() end)
        -- use ctrl+q for closing the debug session and debugger.
        -- again, nvim-dap-ui will listen for this and close the ui
        -- vim.keymap.set('n', '<C-q>', function()
        --     require'dap'.terminate()
        -- end)

        -- keymaps to be able to work in windows terminal, which does not forward some of the
        -- keys (e.g. F5, F11)
        vim.keymap.set('n', '<leader>ü', function() require'dap'.continue() end)
        vim.keymap.set('n', '<leader>+', function()
            require'dap'.terminate()
        end)
        -- find some keys next to each other, in which the left key
        -- and the right key in lower and upper case are not already in use.
        -- tries so far:
        -- . and , (interferes with fF in-line search),
        -- o and p (interferes with pasting)
        -- n and m (intereferes with jumping to next search entry)
        -- ö and ä (about 5 times. and it works, but only if you use Ä, not <S-ä> or <S-Ä>)
        -- 9 and 0 (Ger keyboard, shift + 0 is =, which is taken as well)
        vim.keymap.set('n', 'ö', function() require'dap'.step_over() end)
        vim.keymap.set('n', 'ä', function() require'dap'.step_into() end)
        vim.keymap.set('n', 'Ä', function() require'dap'.step_out() end)

        -- additionally: keys to handle breakpoints
        vim.keymap.set('n', '<leader>b', function() require'dap'.toggle_breakpoint() end)
        vim.keymap.set('n', '<leader>B', function()
            require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
        vim.keymap.set('n', '<leader><C-B>', function()
            require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)

        -- change the lines' colors for specific purposes
        -- (this is only applied in conjunction with the sign_define)
        vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

        -- set some nicer symbols for breakpoints etc
        -- vim.fn.sign_define('DapBreakpoint',
        --     { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
        vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
        vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
        vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

    end,
}

