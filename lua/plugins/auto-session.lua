return
{
		'rmagatti/auto-session',
        lazy = false,
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_supress_dirs = {
					"~/",
					"~/Downloads",
					"/",
				},

				-- set keymap for searching a session in telescope
				vim.keymap.set('n', "<leader>fs", require("auto-session.session-lens").search_session,{
					noremap = true, desc = "Browse sessions",
				})
			})

			-- vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		end
}
