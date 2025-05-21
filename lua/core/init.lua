-- lua/core/init.lua
-- Central entry for “core” settings:
--  • options: global & window options like tabstop, number, relativenumber, etc.
--  • keymaps: all your custom key bindings
--  • autocmds: autocommand groups for filetype setups, yank-highlighting, etc.

-- Load editor options (vim.opt / vim.o)
require("core.options")

-- Load custom key mappings (vim.keymap.set)
require("core.keymaps")

-- Load autocmd definitions (vim.api.nvim_create_autocmd)
require("core.autocmds")
