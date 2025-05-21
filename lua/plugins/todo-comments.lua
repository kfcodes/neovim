-- Plugin: todo-comments.nvim
-- Highlight and navigate TODO, FIXME, etc. comments.
-- Loaded on buffer read/new.

return {
  "folke/todo-comments.nvim",
  event        = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo = require("todo-comments")

    -- Keymaps for jumping between comments
    local map = vim.keymap.set
    map("n", "]t", todo.jump_next, { desc = "Next TODO comment" })
    map("n", "[t", todo.jump_prev, { desc = "Previous TODO comment" })

    -- Setup with default settings
    todo.setup()
  end,
}
