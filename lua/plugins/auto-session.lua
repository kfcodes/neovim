-- Plugin: auto-session
-- Automatically save and restore work sessions.
-- Loaded at startup (no lazy-load event).

return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")
    auto_session.setup({
      auto_restore_enabled     = false,
      auto_session_suppress_dirs = {
        "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/"
      },
    })

    -- Keymaps for manual session control
    local map = vim.keymap.set
    map("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
    map("n", "<leader>ws", "<cmd>SessionSave<CR>",    { desc = "Save session for cwd" })
  end,
}
