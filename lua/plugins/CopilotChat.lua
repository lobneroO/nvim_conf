-- only for work
return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },

    config = function()
        vim.keymap.set('n', '<leader>cp', function()
            require('CopilotChat').toggle()
        end, { desc = 'Toggle CopilotChat' })
        vim.keymap.set('n', '<leader>cr', function()
            require('CopilotChat').reset()
        end, { desc = 'Reset CopilotChat' })

        require('fzf-lua').register_ui_select()

        -- setup a file picker for copilot chat
        vim.keymap.set('n', '<leader>cf', function()
            require('fzf-lua').files({
                actions = {
                    ['default'] = function(selected)
                        vim.api.nvim_put({ selected[1] }, 'c', true, true)
                    end,
                }
            })
        end, { desc = 'FZF file picker for CopilotChat' })
    end,
}
