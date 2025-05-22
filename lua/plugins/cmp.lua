-- Plugin: nvim-cmp + sources
-- Auto-completion framework loaded on InsertEnter.
-- Now with Tab/Shift-Tab navigation and CR confirm.

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",        -- buffer completions
    "hrsh7th/cmp-path",          -- filesystem paths
    {
      "L3MON4D3/LuaSnip",        -- snippet engine
      version = "v2.*",
      build   = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",  -- LuaSnip completions
    "rafamadriz/friendly-snippets", -- a set of useful snippets
    "onsails/lspkind.nvim",      -- VSCode-like pictograms
  },
  config = function()
    local cmp     = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Load VSCode-style snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      mapping = cmp.mapping.preset.insert({
        -- Tab moves to next item; Shift-Tab to previous
        ["<Tab>"]   = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"]    = cmp.mapping.confirm({ select = true }),
        -- Keep your other mappings if any…
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "…" }),
      },
    })
  end,
}
