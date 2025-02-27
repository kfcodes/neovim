return {
  "hrsh7th/nvim-cmp",      -- Autocompletion core plugin
  "hrsh7th/cmp-nvim-lsp",  -- LSP-based autocompletion
  "saadparwaiz1/cmp_luasnip", -- Snippet support

  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }
    })
  end
}

