-- Show indent guides via indent-blankline.nvim

-- the plugin exports itself as 'ibl'
require("ibl").setup({
  indent = { char = "┊" },  -- use a thin vertical bar
})
