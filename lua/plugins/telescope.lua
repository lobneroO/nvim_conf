return {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
        {
            'nvim-telescope/telescope-live-grep-args.nvim',
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
	},
	-- add some key mappings to access the telescope functionalities
	config = function()
		local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fa', builtin.resume, { desc = "Resume search (_F_ind _A_gain)" })
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find file" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find in buffers" })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Key Maps" })
		vim.keymap.set('n', '<leader>fp', builtin.git_files, { desc = "Find files in git repository" })
		vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "Find references" })
        vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = "Find word under cursor" })
		vim.keymap.set('n', '<leader>fw',
			function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end, { desc = "Find files in git repository" })

        require('telescope').setup {
            extensions = {
                git_diffs = {
                    git_command = { "git", "log", "--oneline", "--decorate", "--graph", "--all" } --, "." }
                }
            }
        }
        local telescope = require('telescope')
        telescope.load_extension('git_diffs')
        vim.keymap.set('n', '<leader>dc',
            function()
                require('telescope').extensions.git_diffs.diff_commits()
            end,
            { desc = "Diff HEAD against commit" })

        -- enable arguments for the live grep search. this enables, for example,
        -- searching only files of a certain type:
        -- (rg) -t h -t cpp "cuda" src
        -- this searches all .h and .cpp files for "cuda" in the directory "src"
        telescope.load_extension('live_grep_args')
		vim.keymap.set('n', '<leader>fg',
            function()
                telescope.extensions.live_grep_args.live_grep_args()
            end, { desc = "Live grep" })


        -- add custom picker to set fileformat (i.e. EOL characters)
        local pickers = require "telescope.pickers"
        local finders = require "telescope.finders"
        local conf = require("telescope.config").values
        local actions = require "telescope.actions"
        local action_state = require "telescope.actions.state"

        local ffs = function(opts)
            opts = opts or {}
            pickers.new(opts, {
                primpt_title = "file format",
                finder = finders.new_table {
                    results = { "unix", "dos", "mac" }
                },
                sorter = conf.generic_sorter(opts),
                -- default behaviour of a picker would be to open the picked entry
                -- as a new buffer. to avoid that, create a custom action
                attach_mappings = function(prompt_bufnr, map)
                    actions.select_default:replace(function()
                        -- action.close here will close the picker
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry()
                        -- here we have the selection in selection[1] and can act on it
                        vim.cmd("set fileformat=" .. selection[1])
                    end)
                    return true
                end
            }):find()
        end

        vim.keymap.set('n', '<leader>sff', function()
            ffs()
        end, { desc = "Set fileformat for End of Line" })
	end,
}

