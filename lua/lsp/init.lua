-- Orchestrates Neodev, diagnostic signs, Mason-LSPConfig, and per-server overrides.

-- ─── 1) Neodev: make ‘lua’ development seamless (e.g. recognize runtime files)
require("neodev").setup({})

-- ─── 2) Shared handlers & capabilities
local handlers = require("lsp.handlers")
local capabilities = handlers.capabilities -- from lua/lsp/handlers.lua

-- ─── 3) Custom diagnostic symbols in the sign column
for type, icon in pairs({
	Error = " ",
	Warn = " ",
	Hint = "󰠠 ",
	Info = " ",
}) do
	vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
end

-- ─── 4) Mason-LSPConfig: install & configure your LSP servers
local mlsp = require("mason-lspconfig")
local servers = require("lsp.servers") -- from lua/lsp/servers.lua

-- `opts = { ensure_installed = { … } }` came from your plugin spec,
-- so here we just pass our `handlers` table:
mlsp.setup({
	-- Handlers: first entry is the default for *any* server,
	-- and then we merge in any per-server overrides from `servers.lua`.
	handlers = vim.tbl_extend("force", {
		-- Default handler for all servers
		function(server_name)
			require("lspconfig")[server_name].setup({
				on_attach = handlers.on_attach,
				capabilities = capabilities,
			})
		end,
	}, servers),
})
