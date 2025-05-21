-- lua/config/plugins.lua
-- Returns a list of plugin specifications for Lazy.nvim.
-- Each entry can be:
--   • A string: shorthand for "owner/repo" on GitHub.
--   • A table: allows extra options like lazy-loading, events, etc.

return {
  -- Utility library providing common Lua functions.
  -- Many plugins depend on this under the hood.
  "nvim-lua/plenary.nvim",

  -- Seamless navigation between Vim splits and tmux panes.
  -- Reuses the same keybindings in both environments.
  "christoomey/vim-tmux-navigator",

  -- Add more plugins here, e.g.:
  -- { "author/plugin-name", lazy = true, event = "VeryLazy" },
}
