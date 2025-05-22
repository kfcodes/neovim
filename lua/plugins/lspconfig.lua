-- Plugin: nvim-lspconfig + Mason + extra LSP tooling
-- We declare the servers & tools we want installed (via opts),
-- disable mason-lspconfig’s built-in auto-enable, and then
-- delegate to lua/lsp/init.lua for all on_attach & setup_handlers.

-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 3) LSP & Tooling: language servers, formatters, debuggers, etc.           │
-- └────────────────────────────────────────────────────────────────────────────┘
-- require("lsp")            -- sets up Mason, lspconfig handlers, and per-server configs



return {
  "neovim/nvim-lspconfig",
  { "neovim/nvim-lspconfig", tag = "v1.21.2" },  -- pin to the last 0.9-compatible release
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    -- Mason core installer
    { "williamboman/mason.nvim", opts = {
        ui = {
          icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },

    -- Mason-LSP bridge, with our desired servers
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed  = {
          "pyright", "rust_analyzer",
          "html", "cssls", "tailwindcss", "svelte",
          "lua_ls", "graphql", "emmet_ls", "prismals",
        },
        automatic_enable  = false,  -- ⚠ disable broken auto-enable
      },
    },

    -- Mason tool installer for formatters & linters
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = { "prettier", "stylua", "black", "isort", "eslint_d", "pylint" },
      },
    },

    -- LSP → CMP integration
    "hrsh7th/cmp-nvim-lsp",

    -- Extra helpers
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                opts   = {} },
  },

  config = function()
    -- All dependencies are on the rtp now; hand off to your lsp module.
    require("lsp")
  end,
}
