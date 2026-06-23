-- lua/plugins/lspconfig.lua
-- Loads nvim-lspconfig and enables our LSP setup from lua/lsp/.

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"b0o/SchemaStore.nvim",
	},

	config = function()
		require("lsp")
	end,
}
