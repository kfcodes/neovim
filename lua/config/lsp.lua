-- Ensure Mason and LSP are initialized
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "tsserver" } -- Add LSP servers here
})

-- Configure LSP
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})

