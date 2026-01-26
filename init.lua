-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 1) Core: fundamental editor settings                                       │
-- └────────────────────────────────────────────────────────────────────────────┘
require("core") -- loads lua/core/init.lua, which in turn does:
--   • core.options  (vim.opt & global vim.o settings)
--   • core.keymaps  (all vim.keymap.set calls)
--   • core.autocmds (autocommand groups)

-- ┌────────────────────────────────────────────────────────────────────────────┐
-- │ 2) Plugins: install and configure third-party extensions                   │
-- └────────────────────────────────────────────────────────────────────────────┘
require("plugins") -- bootstrap your plugin manager (e.g. Lazy.nvim)
-- and declare plugins + lazy-load rules
