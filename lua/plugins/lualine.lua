-- Plugin: lualine.nvim
-- Statusline with custom theme and Lazy update count; delegate to ui.statusline
-- Loaded on first statusline draw.

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config       = function()
    require("ui.statusline")
  end,
}
