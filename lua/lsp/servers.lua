-- lua/lsp/servers.lua
-- Source of truth for LSP server configuration.

local M = {}

local handlers = require("lsp.handlers")

M.servers = {
	-- Python:
	-- pyright gives completion, goto definition, references, hover, and type checking.
	pyright = {
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
					typeCheckingMode = "basic",
				},
			},
		},
	},

	-- Ruff:
	-- fast Python diagnostics and code actions.
	-- Formatting is intentionally handled by black through conform.nvim.
	ruff = {
		init_options = {
			settings = {
				args = {},
			},
		},
	},

	-- HTML:
	-- plain HTML plus common server-rendered template filetypes.
	html = {
		filetypes = {
			"html",
			"htmldjango",
		},
	},

	-- HTMX:
	-- attribute completion for hx-* attributes.
	htmx = {
		filetypes = {
			"html",
			"htmldjango",
		},
	},

	-- CSS:
	-- CSS, SCSS, LESS support through vscode-css-language-server.
	cssls = {},

	-- JSON:
	-- JSON validation/completion plus schema support.
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = {
					enable = true,
				},
			},
		},
	},

	-- JavaScript / TypeScript:
	-- works for .js, .jsx, .ts, .tsx.
	ts_ls = {},

	-- Shell scripts:
	-- Useful for bash/sh files. Avoid forcing this onto .env files.
	bashls = {
		filetypes = {
			"sh",
			"bash",
			"zsh",
		},
	},
}

function M.setup()
	vim.diagnostic.config({
		virtual_text = {
			spacing = 4,
			source = "if_many",
		},
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = "rounded",
			source = "always",
		},
	})

	for server_name, server_config in pairs(M.servers) do
		server_config.capabilities =
			vim.tbl_deep_extend("force", {}, handlers.capabilities, server_config.capabilities or {})

		server_config.on_attach = handlers.on_attach

		vim.lsp.config(server_name, server_config)
		vim.lsp.enable(server_name)
	end
end

return M
