-- lua/plugins/dadbod.lua
-- Database browsing, query editing, and SQL completion.

return {
	{
		"kristijanhusak/vim-dadbod-ui",
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		dependencies = {
			{
				"tpope/vim-dadbod",
				lazy = true,
			},
			{
				"kristijanhusak/vim-dadbod-completion",
				ft = {
					"sql",
					"mysql",
					"plsql",
				},
				lazy = true,
			},
		},
		keys = {
			{ "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Database UI" },
			{ "<leader>dB", "<cmd>DBUIAddConnection<CR>", desc = "Add database connection" },
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod-ui"
		end,
	},
}
