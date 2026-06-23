-- lua/plugins/fugitive.lua
-- Tpope Git workflow.

return {
	{
		"tpope/vim-fugitive",
		cmd = {
			"Git",
			"G",
			"Gdiffsplit",
			"Gvdiffsplit",
			"Gedit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GRename",
			"GDelete",
			"GBrowse",
		},
		keys = {
			{ "<leader>gg", "<cmd>Git<CR>", desc = "Git status" },
			{ "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
			{ "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git diff split" },
			{ "<leader>gB", "<cmd>GBrowse<CR>", mode = { "n", "v" }, desc = "Open in browser" },
		},
	},

	{
		"tpope/vim-rhubarb",
		dependencies = {
			"tpope/vim-fugitive",
		},
		cmd = {
			"GBrowse",
		},
	},
}
