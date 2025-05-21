-- Plugin: indent-blankline.nvim
-- Show indent guides; delegate to ui.indentline
-- Loaded when a buffer is read or created.

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main  = "ibl",  -- plugin exports itself as `require("ibl")`
  config = function()
    require("ui.indentline")
  end,
}
