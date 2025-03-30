local utils = require("utils")

utils.map("<Esc>", "<cmd>nohlsearch<CR>")
-- Keybinds to make split navigation easier.
utils.map("<C-h>", "<C-w><C-h>", "Move focus to the left window")
utils.map("<C-l>", "<C-w><C-l>", "Move focus to the right window")
utils.map("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
utils.map("<C-k>", "<C-w><C-k>", "Move focus to the upper window")
-- create a new line in normal mode
utils.map("<CR>", "m`o<Esc>``", "Add new line under the cursor")
utils.map("<S-CR>", "m`O<Esc>``", "Add new line above the cursor")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
