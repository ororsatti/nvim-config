local utils = require("utils")

return {
	"stevearc/oil.nvim",
	opts = {
		columns = {
			"icon",
			-- "permissions",
			"size",
			-- "mtime",
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,

	init = function()
		utils.map("-", "<CMD>Oil<CR>", "open parent directory")
	end,
}
