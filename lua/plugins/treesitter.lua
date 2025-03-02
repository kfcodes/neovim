require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "yaml", "json", "javascript", "tsx", "dockerfile", "bash", "lua", "latex" },
    highlight = { enable = true },
    indent = { enable = true },
})
