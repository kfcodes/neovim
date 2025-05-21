-- Show buffers as tabs in the tabline; delegate to ui.bufferline
-- Loaded lazily when Neovim is idle to speed up startup.

return {
  "akinsho/bufferline.nvim",
  event        = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config       = function()
    require("ui.bufferline")
  end,
}
