return {
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

	graphql = {
		filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
	},

	emmet_ls = {
		filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
	},

	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				completion = { callSnippet = "Replace" },
			},
		},
	},
}
