-- Plugin: conform.nvim
-- Auto-format your code on save or via keybinding.
-- Pinned to v7.1.0 so it remains compatible with Neovim <0.10.

return {
  "stevearc/conform.nvim",
  tag   = "v7.1.0",                            -- last version before Neovim 0.10 requirement
  event = { "BufReadPre", "BufNewFile" },      -- load when a buffer is read or created
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        javascript       = { "prettier" },
        typescript       = { "prettier" },
        javascriptreact  = { "prettier" },
        typescriptreact  = { "prettier" },
        svelte           = { "prettier" },
        css              = { "prettier" },
        html             = { "prettier" },
        json             = { "prettier" },
        yaml             = { "prettier" },
        markdown         = { "prettier" },
        graphql          = { "prettier" },
        liquid           = { "prettier" },
        lua              = { "stylua"   },
        python           = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async        = false,
        timeout_ms   = 1000,
      },
    })

    -- Keymap to manually format
    vim.keymap.set(
      { "n", "v" },
      "<leader>mp",
      function()
        require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
      end,
      { desc = "Format file or range" }
    )
  end,
}
