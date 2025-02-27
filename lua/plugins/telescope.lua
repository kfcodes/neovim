return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Dependency for async operations

  config = function()
    require("telescope").setup({})
    vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
  end
}
