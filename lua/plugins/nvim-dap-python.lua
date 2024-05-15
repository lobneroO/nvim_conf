-- debugger for python setup

return {
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap"
	},

	config = function()
		require("dap-python").setup(
			-- suggested is "~/.virtualenvs/debugpy/bin/python"
			"python"
		)
	end
}

