-- lua/plugins/mason.lua
-- Installs and manages external editor tooling:
-- LSP servers, formatters, linters, and helper binaries.

return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			-- These are lspconfig server names, not Mason package names.
			ensure_installed = {
				"pyright",
				"ruff",
				"html",
				"cssls",
				"jsonls",
				"ts_ls",
				"bashls",
			},

			-- Keep server enabling in lua/lsp/init.lua so our structure remains clear.
			automatic_enable = false,
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				-- Python
				"black",

				-- Web / JSON
				"prettier",

				-- Shell / config-ish files
				"shfmt",

				-- Lua config formatting
				"stylua",

				-- HTMX attributes/completion
				"htmx-lsp",
			},

			auto_update = false,
			run_on_start = true,
			start_delay = 3000,
			debounce_hours = 12,
		},
	},
}
