-- Plugin: trouble.nvim
-- A pretty diagnostics, references, quickfix, and location list UI.
-- Loaded on Trouble command or keybinding.

return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	cmd = "Trouble",
	opts = {
		focus = true,
	},
	keys = {
		{
			"<leader>xw",
			"<cmd>Trouble diagnostics toggle<CR>",
			desc = "Workspace Diagnostics",
		},
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Document Diagnostics",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<CR>",
			desc = "Quickfix List",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<CR>",
			desc = "Location List",
		},
		{
			"<leader>xt",
			"<cmd>Trouble todo toggle<CR>",
			desc = "TODO List",
		},
	},
}
