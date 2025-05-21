-- Plugin: nvim-tree.lua
-- A file explorer tree for Neovim.
-- Loaded on the first file-explorer command.

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    -- Disable built-in netrw
    vim.g.loaded_netrw       = 1
    vim.g.loaded_netrwPlugin = 1

    -- Basic setup
    require("nvim-tree").setup({
      view = { width = 35, relativenumber = true },
      renderer = {
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            folder = { arrow_closed = "", arrow_open = "" },
          },
        },
      },
      actions = { open_file = { window_picker = { enable = false } } },
      filters = { custom = { ".DS_Store" } },
      git     = { ignore = false },
    })

    -- Explorer keymaps
    local map = vim.keymap.set
    map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>",         { desc = "Toggle File Explorer" })
    map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Find File in Explorer" })
    map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>",       { desc = "Collapse Explorer" })
    map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>",        { desc = "Refresh Explorer" })
  end,
}
