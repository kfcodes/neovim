-- Plugin: dressing.nvim
-- Improves native vim.ui interfaces (input, select).
-- Loaded when Neovim is idle to avoid startup impact.

return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = true,  -- just call its default setup()
}
