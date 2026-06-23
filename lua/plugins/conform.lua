-- lua/plugins/conform.lua
-- Plugin: conform.nvim
-- Lightweight formatter integration with format-on-save.
--
-- Responsibilities:
-- - Choose formatters by filetype.
-- - Format automatically on save.
-- - Fall back to LSP formatting when no external formatter is configured.
--
-- Formatter choices:
-- - Python: black
-- - Lua: stylua
-- - Shell/env/conf-style files: shfmt where useful
-- - Web/JSON: prettier

return {
	"stevearc/conform.nvim",

	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },

	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({
					async = true,
					lsp_format = "fallback",
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or selection",
		},
	},

	opts = {
		formatters_by_ft = {
			-- Lua
			lua = { "stylua" },

			-- Python
			python = { "black" },

			-- Web
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			less = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },

			-- JSON
			json = { "prettier" },
			jsonc = { "prettier" },

			-- Shell
			sh = { "shfmt" },
			bash = { "shfmt" },
			zsh = { "shfmt" },

			-- Config-style files.
			-- Many .conf files have different syntaxes, so we do not force a universal formatter.
			-- LSP fallback below can handle these if an attached LSP supports formatting.
			conf = {},

			-- .env files are usually simple KEY=value files.
			-- Do not run prettier/black/shfmt on them.
			dotenv = {},
		},

		format_on_save = function(bufnr)
			local disabled_filetypes = {
				-- Keep env files untouched on save.
				dotenv = true,
			}

			local ft = vim.bo[bufnr].filetype
			if disabled_filetypes[ft] then
				return nil
			end

			return {
				timeout_ms = 3000,
				lsp_format = "fallback",
			}
		end,
	},
}
