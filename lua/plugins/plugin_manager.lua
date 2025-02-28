-- ~/.config/nvim/lua/plugins/core.lua

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
    -- Plugin manager
    { "folke/lazy.nvim" },
})
