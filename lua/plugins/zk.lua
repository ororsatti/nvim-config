local utils = require("utils")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values
local themes = require("telescope.themes")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local log = require("plenary.log"):new("zk")
log.level = "debug"

local function zk_new()
	local opts = {}
	pickers
		.new(opts, {
			finder = finders.new_oneshot_job({ "bash", "-c", "ls -1 -d */" }, {
				entry_maker = function(line)
					return { value = line, display = line, ordinal = line }
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)

					require("zk.api").new(vim.uv.cwd(), {
						title = vim.fn.input("Title: "),
						dir = action_state.get_selected_entry().value,
						edit = true,
					})
				end)

				return true
			end,
		})
		:find()
end

return {
	"zk-org/zk-nvim",

	config = function()
		require("zk").setup({
			telescope = require("telescope.themes").get_ivy(),
		})

		utils.map("<leader>zn", zk_new, "create a new note", "n")

		local opts = { noremap = true, silent = false }
		vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)
	end,
}
