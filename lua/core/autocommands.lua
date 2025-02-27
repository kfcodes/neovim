local group = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Auto reload file when changed externally
group("AutoReload", { clear = true })
autocmd("FocusGained,BufEnter", {
  group = "AutoReload",
  command = "checktime"
})

-- Remove trailing whitespaces on save
group("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  group = "TrimWhitespace",
  pattern = "*",
  command = [[%s/\s\+$//e]]
})

