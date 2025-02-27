local group = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Auto reload file when changed externally
local AutoReload = group("AutoReload", { clear = true })
autocmd({ "FocusGained", "BufEnter" }, { -- Fix: Separate events into a table
  group = AutoReload,
  command = "checktime"
})

-- Remove trailing whitespaces on save
local TrimWhitespace = group("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  group = TrimWhitespace,
  pattern = "*",
  command = [[%s/\s\+$//e]]
})
