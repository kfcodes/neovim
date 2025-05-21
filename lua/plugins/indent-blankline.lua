-- Plugin: indent-blankline.nvim
-- Show editor indent guides.
-- Loaded when a buffer is read or created.

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",  -- plugin exports under `require("ibl")`
  opts = {
    indent = { char = "┊" },  -- use a thin vertical bar
  },
}
