-- ~/.config/nvim/lua/plugins/syntax_and_highlighting.lua

return {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-treesitter/playground" },
    { "gruvbox-community/gruvbox" },  -- Colorscheme
    { "nvim-lualine/lualine.nvim" },  -- Statusline
}
