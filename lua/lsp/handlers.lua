-- lua/lsp/handlers.lua
-- Shared LSP capabilities and buffer-local LSP keymaps.

local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

function M.on_attach(client, bufnr)
	-- Ruff should provide diagnostics/code actions, but Pyright should own hover.
	if client and client.name == "ruff" then
		client.server_capabilities.hoverProvider = false
		client.server_capabilities.documentFormattingProvider = false
	end

	local nmap = function(keys, fn, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, fn, {
			buffer = bufnr,
			desc = desc,
		})
	end

	nmap("gd", vim.lsp.buf.definition, "Go to definition")
	nmap("gD", vim.lsp.buf.declaration, "Go to declaration")
	nmap("gr", vim.lsp.buf.references, "List references")
	nmap("gi", vim.lsp.buf.implementation, "Go to implementation")

	nmap("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")

	nmap("K", vim.lsp.buf.hover, "Hover documentation")

	nmap("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
	nmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
	nmap("<leader>dd", vim.diagnostic.open_float, "Show diagnostics")
end

return M
