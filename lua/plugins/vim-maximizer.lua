-- Plugin: vim-maximizer
-- Toggle maximize/minimize of the current split.
-- Loaded on its keybinding.

return {
  "szw/vim-maximizer",
  keys = {
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Toggle split maximization" },
  },
}
