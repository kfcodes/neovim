-- lua/lsp/servers.lua
-- Custom settings for individual servers. The keys here must match
-- the names used by mason-lspconfig (e.g. "lua_ls", "graphql", etc).

return {
	-- Svelte: patch its on_attach again and watch JS/TS files
	svelte = {
		on_attach = function(client, bufnr)
			require("lsp.handlers").on_attach(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePost", {
				buffer = bufnr,
				pattern = { "*.js", "*.ts" },
				callback = function(ctx)
					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
				end,
			})
		end,
	},

	-- GraphQL: support extra filetypes
	graphql = {
		filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
	},

	-- Emmet: HTML/CSS-like filetypes
	emmet_ls = {
		filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
	},

	-- Lua LS: recognize 'vim' global and enable snippet replace
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				completion = { callSnippet = "Replace" },
			},
		},
	},

	-- Add more servers here if you need...
}
