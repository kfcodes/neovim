-- ~/.config/nvim/lua/plugins/ui_and_navigation.lua

return {
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "ThePrimeagen/harpoon" },
    { "akinsho/bufferline.nvim" },  -- Buffer navigation
    { "folke/which-key.nvim" },  -- Key mapping hints
}
