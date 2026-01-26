-- lua/plugins/lspconfig.lua
-- Plugin: nvim-lspconfig + Mason + extra LSP tooling
-- Installs & manages your LSP servers, formatters, and helpers,
-- then delegates actual server setup to lua/lsp/init.lua.

return {
	"neovim/nvim-lspconfig",
	branch = "master", -- pin to the repo’s master branch (where the code actually lives)
	event = { "BufReadPre", "BufNewFile" },

	-- Dependencies are available on the runtime path before config()
	dependencies = {
		-- 1) Mason core: manage external LSP servers, linters, formatters
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},

		-- 2) Mason-LSP bridge: install & register servers, but don’t auto-enable them
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"pyright",
					"rust_analyzer",
					"html",
					"cssls",
					"tailwindcss",
					"svelte",
					"lua_ls",
					"graphql",
					"emmet_ls",
					"prismals",
				},
				automatic_installation = true, -- auto-install & auto-setup all ensured servers
			},
		},

		-- 3) Mason tool installer: ensure formatters & linters are present
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = { "prettier", "stylua", "black", "isort", "eslint_d", "pylint", "flake8", "mypy" },
			},
		},

		-- 4) LSP → nvim-cmp integration
		"hrsh7th/cmp-nvim-lsp",

		-- 5) Extra LSP helpers
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},

	-- At this point all deps are on &rtp; hand off to your lsp module
	config = function()
		require("lsp")
	end,
}
