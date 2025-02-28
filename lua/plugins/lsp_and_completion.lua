return {
  "neovim/nvim-lspconfig",      -- Core LSP configurations
  "williamboman/mason.nvim",    -- Package manager for LSP/DAP
  "williamboman/mason-lspconfig.nvim", -- Mason bridge for LSP

  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "tsserver" } -- Add more servers as needed
    })
  end
}
