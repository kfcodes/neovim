return {
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "tsserver" }
    })

    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.tsserver.setup({})
  end
}

