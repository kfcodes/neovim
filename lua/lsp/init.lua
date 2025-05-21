-- 1) Mason + mason-tool-installer have been configured by the plugin spec’s opts
-- 2) Neodev for smooth Lua development
-- 3) Common on_attach & capabilities
-- 4) setup_handlers for each server, with per-server overrides

-- ─── Neodev (Lua config helper) ───────────────────────────────────────────────
require("neodev").setup({})

-- ─── Handlers & Capabilities ───────────────────────────────────────────────────
local handlers     = require("lsp.handlers")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Custom diagnostic signs
for type, icon in pairs({ Error=" ", Warn=" ", Hint="󰠠 ", Info=" " }) do
  vim.fn.sign_define("DiagnosticSign" .. type, {
    text   = icon,
    texthl = "DiagnosticSign" .. type,
  })
end

-- ─── Setup all servers via Mason-LSPConfig ──────────────────────────────────────
local mlsp = require("mason-lspconfig")

-- `ensure_installed` was already applied via the spec’s opts, so just call setup
mlsp.setup()

-- Apply default handler + per-server overrides
mlsp.setup_handlers(vim.tbl_extend("error", {
  -- Default for any server
  function(server_name)
    require("lspconfig")[server_name].setup({
      on_attach    = handlers.on_attach,
      capabilities = capabilities,
    })
  end,

  -- Svelte needs a special on_attach
  svelte = function()
    require("lspconfig").svelte.setup({
      on_attach    = handlers.on_attach,
      capabilities = capabilities,
      on_attach = function(client, buf)
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end,
    })
  end,

  -- GraphQL needs extra filetypes
  graphql = function()
    require("lspconfig").graphql.setup({
      on_attach    = handlers.on_attach,
      capabilities = capabilities,
      filetypes    = { "graphql","gql","svelte","typescriptreact","javascriptreact" },
    })
  end,

  -- Emmet for HTML/CSS-like filetypes
  emmet_ls = function()
    require("lspconfig").emmet_ls.setup({
      on_attach    = handlers.on_attach,
      capabilities = capabilities,
      filetypes    = { "html","typescriptreact","javascriptreact","css","sass","scss","less","svelte" },
    })
  end,

  -- Lua language server tweaks
  lua_ls = function()
    require("lspconfig").lua_ls.setup({
      on_attach    = handlers.on_attach,
      capabilities = capabilities,
      settings     = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          completion  = { callSnippet = "Replace" },
        },
      },
    })
  end,
}))
