-- lua/lsp/init.lua
-- LSP, DAP, and formatter setup.
-- 1) Bootstrap Mason to install language servers.
-- 2) Define common handlers (keymaps, capabilities, diagnostics).
-- 3) Wire up each server with default handlers.
-- 4) Load any server-specific overrides.

-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 1) Mason: install & manage LSP servers                                     │
-- └────────────────────────────────────────────────────────────────────────────┘
require("mason").setup()                                        -- core Mason setup
require("mason-lspconfig").setup({                              -- bridge Mason → lspconfig
  ensure_installed = { "pyright", "tsserver", "rust_analyzer" },-- servers to auto-install
})

-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 2) Common Handlers: shared on_attach & capabilities                       │
-- └────────────────────────────────────────────────────────────────────────────┘
--   on_attach: maps & commands that run when any LSP server attaches
--   capabilities: extend client capabilities (e.g. completion)
local handlers = require("lsp.handlers")

-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 3) Default Server Setup                                                   │
-- └────────────────────────────────────────────────────────────────────────────┘
-- Use Mason-lspconfig’s setup_handlers to apply the same setup to all servers
require("mason-lspconfig").setup_handlers({
  -- default handler for any server not explicitly overridden below
  function(server_name)
    require("lspconfig")[server_name].setup({
      on_attach    = handlers.on_attach,
      capabilities = handlers.capabilities,
    })
  end,
})

-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 4) Server-specific Overrides                                               │
-- └────────────────────────────────────────────────────────────────────────────┘
-- Any custom settings for individual servers live in lua/lsp/servers.lua
require("lsp.servers")
