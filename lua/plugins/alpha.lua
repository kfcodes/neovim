-- Plugin: alpha-nvim
-- Dashboard / startup screen; delegate to ui.alpha module
-- Loaded on VimEnter to show the dashboard when Neovim starts.

return {
  "goolord/alpha-nvim",
  event  = "VimEnter",
  config = function()
    require("ui.alpha")
  end,
}
