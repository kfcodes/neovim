-- lua/plugins/cmp.lua
-- Plugin: nvim-cmp + completion sources.
-- Auto-completion framework loaded on InsertEnter.
--
-- Provides:
-- - LSP completion
-- - snippet completion
-- - buffer completion
-- - path completion
-- - SQL/database completion through vim-dadbod-completion

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP completions
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- filesystem paths

		{
			"L3MON4D3/LuaSnip", -- snippet engine
			version = "v2.*",
			build = "make install_jsregexp",
		},

		"saadparwaiz1/cmp_luasnip", -- LuaSnip completions
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- VSCode-like pictograms

		-- Database completion source.
		-- Used only for sql/mysql/plsql filetypes below.
		"kristijanhusak/vim-dadbod-completion",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Load VSCode-style snippets.
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({
					select = true,
				}),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "…",
				}),
			},
		})

		-- SQL/database completion.
		-- Scoped to database-related filetypes so it does not affect normal coding.
		cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
			sources = cmp.config.sources({
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
