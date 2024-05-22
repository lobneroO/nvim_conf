-- setup for rust. rust analyzer and rust-gdb work fine on linux
-- but getting it set up on windows is a pain

return {
	"mrcjkb/rustaceanvim",
	version = '^4',
	lazy = false, -- plugin is already lazy,

	config = function()

	end
}
