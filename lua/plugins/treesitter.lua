return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	ensure_installed = {
		"javascript",
		"typescript",
		"go",
		"c",
		"lua",
	},
	auto_install = false,
	highlight = {
		enable = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
