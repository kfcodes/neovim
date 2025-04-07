-- Bootstrap Lazy.nvim (Plugin Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load Core Settings (Options, Keymaps, Autocommands)
require("core")
require("lazy").setup("plugins")

require("lazy").setup("plugins", {
    checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
