-- 1️⃣ Bootstrap Lazy.nvim (Plugin Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2️⃣ Load Core Settings (Options, Keymaps, Autocommands)
require("core")

-- 3️⃣ Load Plugins from `lua/plugins/`
require("lazy").setup(require("plugins"))

-- 4️⃣ Load Plugin Configurations from `lua/config/`
require("plugin_configs")

