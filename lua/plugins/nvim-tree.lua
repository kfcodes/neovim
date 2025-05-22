-- Plugin: nvim-tree.lua
-- File explorer; delegate to ui.tree
-- Loaded on file-explorer commands.

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config       = function()
    require("ui.nvim-tree")
  end,
}
