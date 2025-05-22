-- Configure nvim-tree.lua as your file explorer
-- disable built-in netrw so nvim-tree can take over
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    width          = 35,
    relativenumber = true,
  },
  renderer = {
    indent_markers = { enable = true },
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open   = "",
        },
      },
    },
  },
  actions = {
    open_file = { window_picker = { enable = false } },
  },
  filters = {
    custom = { ".DS_Store" },
  },
  git = { ignore = false },
})

-- keymaps for toggling/exploring
local map = vim.keymap.set
map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>",             { desc = "Toggle file explorer" })
map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>",     { desc = "Explorer find current file" })
map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>",           { desc = "Collapse explorer" })
map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>",            { desc = "Refresh explorer" })
