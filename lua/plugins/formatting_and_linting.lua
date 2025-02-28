-- ~/.config/nvim/lua/plugins/formatting_and_linting.lua

return {
    { "jose-elias-alvarez/null-ls.nvim" },  -- Linting & formatting integration
    { "psf/black" },  -- Python formatter
    { "prettier/vim-prettier", run = "yarn install --frozen-lockfile" },
    { "mfussenegger/nvim-lint" },  -- Linting support
}
