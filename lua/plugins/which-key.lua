-- Plugin: which-key.nvim
-- Displays available keybindings in a popup.
-- Loaded when Neovim is idle.

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init  = function()
    -- Speed up timeout for which-key popup
    vim.o.timeout    = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- Add custom WhichKey setup here, or leave empty for defaults
  },
}
