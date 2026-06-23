-- lua/plugins/which-key.lua
-- Plugin: which-key.nvim
-- Shows available keybindings as you type.

return {
	"folke/which-key.nvim",
	event = "VimEnter",

	dependencies = {
		"echasnovski/mini.icons",
	},

	opts = {
		icons = {},
	},

	config = function(_, opts)
		local wk = require("which-key")

		wk.setup(opts)

		-- Only register group prefixes that do not trigger which-key overlap warnings.
		-- Omitted intentionally:
		--   <leader>d because <leader>dd and <leader>dl are real mappings
		--   <leader>e because <leader>ee is a real mapping
		--   <leader>w because <leader>ww / <leader>wq / <leader>wr are real mappings
		wk.add({
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>h", group = "[H]unks/Git" },
			{ "<leader>r", group = "[R]ename/replace" },
			{ "<leader>s", group = "[S]plit/Search" },
			{ "<leader>x", group = "Trouble/Diagnostics" },
		})
	end,
}
