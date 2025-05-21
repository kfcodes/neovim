-- Plugin: nvim-treesitter
-- Better syntax highlighting, indentation, and text objects.
-- Loaded on buffer read/new.

return {
  "nvim-treesitter/nvim-treesitter",
  event        = { "BufReadPre", "BufNewFile" },
  build        = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag" },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent    = { enable = true },
      autotag   = { enable = true },
      ensure_installed = {
        "bash", "c", "css", "dockerfile", "graphql", "html",
        "javascript", "json", "lua", "markdown", "markdown_inline",
        "prisma", "query", "svelte", "typescript", "tsx", "vim", "yaml",
      },
      incremental_selection = {
        enable        = true,
        keymaps       = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      },
    })
  end,
}
