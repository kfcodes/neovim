-- lua/plugins/init.lua
-- 1) Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2) Discover every plugin spec in this folder
local plugin_files = vim.fn.globpath(
  vim.fn.stdpath("config") .. "/lua/plugins",
  "*.lua",
  false,
  true
)
local plugins = {}

for _, path in ipairs(plugin_files) do
  -- extract filename without extension:
  local name = path:match("lua/plugins/(.+)%.lua$")
  if name and name ~= "init" then
    local spec = require("plugins." .. name)
    -- normalize single-table or list:
    if vim.tbl_islist(spec) then
      vim.list_extend(plugins, spec)
    else
      table.insert(plugins, spec)
    end
  end
end

-- 3) Pass them to Lazy.nvim
require("lazy").setup(plugins, {
  defaults    = { lazy = true },
  performance = { rtp = { disabled_plugins = { "gzip", "tohtml" } } },
})
