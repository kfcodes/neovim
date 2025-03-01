local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("Telescope failed to load", vim.log.levels.ERROR)
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      i = {
        ["<C-n>"] = require("telescope.actions").move_selection_next,
        ["<C-p>"] = require("telescope.actions").move_selection_previous,
        ["<C-c>"] = require("telescope.actions").close,
      },
    },
  },
  pickers = {
    find_files = { hidden = true },
    live_grep = { additional_args = function() return { "--hidden" } end }
  },
  extensions = {},
})

-- Load optional extensions
pcall(function() telescope.load_extension("fzf") end)
