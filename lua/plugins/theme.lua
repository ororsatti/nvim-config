return {
	"vinitkumar/oscura-vim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd([[colorscheme oscura]])
	end,
}
