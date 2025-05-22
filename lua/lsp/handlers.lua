-- Shared LSP handler code: keymaps, commands, and client capabilities.

local M = {}

--- Common on_attach: called when any LSP client attaches to a buffer.
--  Here you can set up buffer-local keymaps and commands.
function M.on_attach(client, bufnr)
	local nmap = function(keys, fn, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = desc })
	end

	-- Navigation
	nmap("gd", vim.lsp.buf.definition, "Go to definition")
	nmap("gD", vim.lsp.buf.declaration, "Go to declaration")
	nmap("gr", vim.lsp.buf.references, "List references")
	nmap("gi", vim.lsp.buf.implementation, "Go to implementation")

	-- Actions
	nmap("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
	nmap("K", vim.lsp.buf.hover, "Hover documentation")

	-- Diagnostics
	nmap("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
	nmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
	nmap("<leader>e", vim.diagnostic.open_float, "Show diagnostics")

	-- You can add more mappings here...
end

--- LSP client capabilities powered by nvim-cmp.
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
