-- Plugin: trouble.nvim
-- A pretty diagnostics, references, quickfix, and location list UI.
-- Loaded on Trouble command or keybinding.

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  cmd          = "Trouble",
  opts         = { focus = true },
  keys = {
    { "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>",  desc = "Workspace Diagnostics" },
    { "<leader>xd", "<cmd>Trouble document_diagnostics<CR>",   desc = "Document Diagnostics" },
    { "<leader>xq", "<cmd>Trouble quickfix<CR>",               desc = "Quickfix List" },
    { "<leader>xl", "<cmd>Trouble loclist<CR>",                desc = "Location List" },
    { "<leader>xt", "<cmd>Trouble todo<CR>",                   desc = "TODO List" },
  },
}
