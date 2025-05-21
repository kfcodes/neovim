-- Plugin: telescope.nvim
-- Fuzzy finder for files, buffers, help tags, etc.
-- Loaded on first Telescope command.

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions   = require("telescope.actions")

    -- Basic Telescope setup
    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings     = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- Load the FZF native extension
    telescope.load_extension("fzf")

    -- Keymaps for common pickers
    local map = vim.keymap.set
    map("n", "<leader>ff", "<cmd>Telescope find_files<CR>",   { desc = "Find files" })
    map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",     { desc = "Recent files" })
    map("n", "<leader>fs", "<cmd>Telescope live_grep<CR>",    { desc = "Live grep" })
    map("n", "<leader>fc", "<cmd>Telescope grep_string<CR>",  { desc = "Grep word under cursor" })
    map("n", "<leader>ft", "<cmd>TodoTelescope<CR>",          { desc = "Find TODOs" })
  end,
}
