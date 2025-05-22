-- lua/plugins/which-key.lua
-- Plugin: which-key.nvim
-- Provides a popup displaying available keybindings and their descriptions,
-- organized into logical groups for easier discovery.

return {
  "folke/which-key.nvim",
  -- Delay loading until after startup to avoid impacting initial load time
  event = "VimEnter",

  -- Options passed to which-key.setup()
  opts = {
    icons = {},  -- Disable mini.icons integration to prevent missing-module warnings
    -- You can add other which-key options here, e.g.:
    -- key_labels = { ["<leader>"] = "SPC" },
    -- window = { border = "rounded", position = "bottom" },
  },

  -- Configuration callback, runs after the plugin is loaded
  config = function(_, opts)
    -- Import the which-key module
    local wk = require("which-key")
    -- Apply the setup options
    wk.setup(opts)

    -- Register groups for leader-key mappings using the new spec format.
    -- Each entry associates a key prefix with a human-readable group name.
    wk.register({
      { "<leader>c", group = "[C]ode" },           -- Code-related commands (e.g., build, run, format)
      { "<leader>d", group = "[D]ebug" },          -- Debugging commands (e.g., breakpoints, step)
      { "<leader>r", group = "[R]ename/replace" }, -- Rename symbols or perform search-and-replace
      { "<leader>s", group = "[S]plit/Search" },   -- Window splitting and search utilities
      { "<leader>w", group = "[W]indow/Tab" },     -- Window and tab management (open, close, navigate)
    })
  end,
}
