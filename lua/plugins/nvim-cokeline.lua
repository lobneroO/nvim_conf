-- add a tab line with status information like errors and save status


return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim",        -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
		"stevearc/resession.nvim"       -- Optional, for persistent history
	},
	config = function()
        local get_hex = require('cokeline.hlgroups').get_hl_attr
        local bg_focused = "none"
        local bg_unfocused = get_hex('Normal', "fg")

	require("cokeline").setup({
            default_hl = {
                fg = function(buffer)

                    return
                        buffer.is_focused
                        -- highlighting of focused buffer works better for vscode 
                        -- colour theme, if we use "comment" for the highlighted,
                        -- since that is green, whereas "normal" is black
                        and get_hex('Comment', 'fg')
                        or get_hex('Normal', 'fg')
                end,
                -- 'ColorColumn' is very dark, making 'Normal' colour unreadable
                -- bg = get_hex('ColorColumn', 'bg'),
                bg = function(buffer)
                    if buffer.is_focused then
                        return bg_focused
                    end
                    return bg_unfocused
                end,
            },

            -- set all components. one cannot add to default ones
            components = {
                {
                    text = '|',
                    fg = function(buffer)
                        return
                            buffer.is_modified and terminal_color_1 or terminal_color_3
                    end,
                },
                {
                    text = function(buffer) return buffer.devicon.icon .. ' ' end,
                    fg = function(buffer) return buffer.devicon.color end,
                },
                {
                    text = function(buffer) return buffer.index .. ': ' end,
                },
                {
                    text = function(buffer) return buffer.unique_prefix end,
                    fg = get_hex('Comment', 'fg'),
                    italic = true,
                },
                {
                    text = function(buffer) return buffer.filename .. ' ' end,
                    bold = function(buffer) return buffer.is_focused end,
                },
                {
                    text = function(buffer)
                        return buffer.is_modified and " ●" or ""
                    end,
                },
                {
                    text = ' ',
                },
            },
        })

		local map = vim.api.nvim_set_keymap

		map("n", "<C-h>", "<Plug>(cokeline-focus-prev)", { desc = "Previous Buffer", silent = true})
		map("n", "<C-l>", "<Plug>(cokeline-focus-next)", { desc = "Next Buffer", silent = true})
		map("n", "<A-h>", "<Plug>(cokeline-switch-prev)", { desc = "Move Buffer left", silent = true})
		map("n", "<A-l>", "<Plug>(cokeline-switch-next)", { desc = "Move Buffer right", silent = true})

        -- select a buffer by index
        for i = 1, 9 do
            map("n",
                ("<leader>sb%s"):format(i),
                ("<Plug>(cokeline-focus-%s)"):format(i),
                { desc = "Select buffer at index", silent = true})
        end
	end,
}

