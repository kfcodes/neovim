-- Entry point for Neovim configuration:
-- 1. Core editor behavior (options, keymaps, autocmds)
-- 2. Plugin manager setup and plugin declarations
-- 3. LSP, DAP, linters and related tooling
-- 4. UI customizations (colorscheme, statusline, icons, etc.)

-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 1) Core: fundamental editor settings                                     │
-- └────────────────────────────────────────────────────────────────────────────┘
require("core")           -- loads lua/core/init.lua, which in turn does:
                          --   • core.options  (vim.opt & global vim.o settings)
                          --   • core.keymaps  (all vim.keymap.set calls)
                          --   • core.autocmds (autocommand groups)

-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 2) Plugins: install and configure third-party extensions                  │
-- └────────────────────────────────────────────────────────────────────────────┘
require("plugins")        -- bootstrap your plugin manager (e.g. Lazy.nvim)
                          -- and declare plugins + lazy-load rules

-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 3) LSP & Tooling: language servers, formatters, debuggers, etc.           │
-- └────────────────────────────────────────────────────────────────────────────┘
-- require("lsp")            -- sets up Mason, lspconfig handlers, and per-server configs

-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 4) UI: all visual tweaks — colorscheme, statusline, bufferline, icons…    │
-- └────────────────────────────────────────────────────────────────────────────┘
-- require("ui")             -- loads lua/ui/init.lua, which in turn does:
                          --   • ui.colors
                          --   • ui.statusline
                          --   • ui.bufferline
                          --   • ui.indentline
                          --   • ui.icons

-- End of init.lua — everything else lives in lua/{core,plugins,lsp,ui}/…
