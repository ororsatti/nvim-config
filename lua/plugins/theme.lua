return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			-- enable compiling the colorscheme
			compile = true,
			-- enable undercurls
			undercurl = true,
			commentStyle = { italic = true },
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			transparent = true,
		})

		vim.cmd("colorscheme kanagawa-dragon")
		print("testing test")
	end,
}
