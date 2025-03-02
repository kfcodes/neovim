-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({

     -- LSP Support
    { "neovim/nvim-lspconfig", config = function() require("plugins.lsp") end },
    { "williamboman/mason.nvim", config = function() require("mason").setup() end },
    { "williamboman/mason-lspconfig.nvim" },

    -- Auto-completion
    { "hrsh7th/nvim-cmp", config = function() require("plugins.cmp") end },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "L3MON4D3/LuaSnip" },

    -- Formatting & Linting
    { "jose-elias-alvarez/null-ls.nvim", config = function() require("plugins.formatters") end },
    { "jay-babu/mason-null-ls.nvim" },

    -- Debugging
    { "mfussenegger/nvim-dap", config = function() require("plugins.dap") end },
    { "mfussenegger/nvim-dap-python" },

    -- Git Support
    { "tpope/vim-fugitive", config = function() require("plugins.git") end },
    { "lewis6991/gitsigns.nvim" },

    -- Core plugins
    { "nvim-lua/plenary.nvim" }, -- Utility functions for many plugins

    -- Treesitter for better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() require("plugins.treesitter") end,
    },

    -- Telescope for fuzzy finding
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("plugins.telescope") end,
    },

    -- File Navigation
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("plugins.nvimtree") end,
    },

    -- Git Integration
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup() end,
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
--        config = function() require("plugins.lualine") end,
    },

    -- Colorscheme (Change to your preferred theme)
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd("colorscheme tokyonight")
        end,
    },
    -- Git Integration
    {
        "tpope/vim-fugitive", -- Full Git integration
    },
    {
        "tpope/vim-rhubarb", -- GitHub integration for vim-fugitive
    },

    -- tpope's Essential Workflow Plugins
    {
        "tpope/vim-surround", -- Easily add/change/delete surrounding characters
    },
    {
        "tpope/vim-repeat", -- Enhances `.` command for plugin compatibility
    },
    {
        "tpope/vim-unimpaired", -- Quick bracket mappings
    },
    {
        "tpope/vim-commentary", -- Easy commenting
    },
    {
        "tpope/vim-sleuth", -- Auto-detects indentation settings
    },
    {
        "tpope/vim-abolish", -- Smart case-changing and search/replace
    },
    -- Latex support for vim
    {
        "lervag/vimtex",
        ft = { "tex", "latex" },  -- Load only for LaTeX files
        config = function() require("plugins.vimtex") end,
    },
}, {
    ui = {
        border = "rounded",
    }
})
