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

mlsp.setup({
	handlers = vim.tbl_extend("force", {
		function(server_name)
			require("lspconfig")[server_name].setup({
				on_attach = handlers.on_attach,
				capabilities = capabilities,
			})
		end,
	}, servers),
})
