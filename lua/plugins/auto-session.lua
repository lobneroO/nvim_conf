return
{
		'rmagatti/auto-session',
        lazy = false,

        --- enables autocomplete for opts
        --- @module "auto-session"
        --- @type AutoSession.Config
        opts = {
            suppressed_dirs = {
                "~/",
                "~/Downloads",
                "/",
            },
            session_lens = {
                picker = "telescope", -- when using nil, it autoselects
                mappings = {
                    delete_session = { "i", "<leader>ds"}
                },
            },
            -- log_level = 'debug',
        },
        load_on_setup = true,
}
