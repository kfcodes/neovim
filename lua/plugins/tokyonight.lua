-- Plugin: tokyonight.nvim
-- Colorscheme setup; delegate to ui.colors
-- Priority 1000 ensures it loads before other UI plugins.

return {
  "folke/tokyonight.nvim",
  priority = 1000,   -- load before other color/UI plugins
  lazy     = false,  -- ensure it’s in your rtp right away
  config   = function()
    require("ui.colors")
  end,
}
