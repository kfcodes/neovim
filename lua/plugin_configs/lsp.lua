local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "tsserver" }
})

lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})

