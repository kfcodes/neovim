-- Plugin: bufferline.nvim
-- Show open buffers as tabs in the tabline.
-- Loaded when Neovim is idle to avoid slowing startup.

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode            = "tabs",   -- display buffers as tabs
      separator_style = "slant",  -- slanted separators between tabs
    },
  },
}
