-- Plugin: substitute.nvim
-- Enhanced substitute operator with motion support.
-- Loaded on buffer read/new.

return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")
    substitute.setup()

    local map = vim.keymap.set
    map("n", "s",  substitute.operator, { desc = "Substitute with motion" })
    map("n", "ss", substitute.line,     { desc = "Substitute entire line" })
    map("n", "S",  substitute.eol,      { desc = "Substitute to end of line" })
    map("x", "s",  substitute.visual,   { desc = "Substitute in visual mode" })
  end,
}
