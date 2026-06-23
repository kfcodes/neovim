-- lua/plugins/treesitter.lua
-- Plugin: nvim-treesitter
-- Better syntax highlighting, indentation, and parsing.
--
-- Important:
-- - We pin to the legacy master branch because this config uses
--   require("nvim-treesitter.configs").
-- - The newer main branch is an incompatible rewrite and does not expose
--   nvim-treesitter.configs.
--
-- This keeps the current project structure stable and avoids unnecessary
-- migration work until you intentionally move to the newer Treesitter API.

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",

	build = ":TSUpdate",

	event = { "BufReadPre", "BufNewFile" },

	opts = {
		ensure_installed = {
			"bash",
			"css",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"sql",
			"vim",
			"vimdoc",
			"yaml",
		},

		auto_install = true,

		highlight = {
			enable = true,
		},

		indent = {
			enable = true,
		},
	},

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
