-- Plugin: Comment.nvim
-- Enables easy commenting/uncommenting of code.
-- Loaded when a buffer is read or created.

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    -- Setup with Treesitter context awareness
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim")
                   .create_pre_hook(),
    })
  end,
}
