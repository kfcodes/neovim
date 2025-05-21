-- Plugin: nvim-lint
-- On-the-fly linting via external linters.
-- Loaded on buffer read/new.

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Configure linters per filetype
    lint.linters_by_ft = {
      javascript      = { "eslint_d" },
      typescript      = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte          = { "eslint_d" },
      python          = { "pylint" },
    }

    local aug = vim.api.nvim_create_augroup("LintGroup", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      group    = aug,
      callback = function() lint.try_lint() end,
    })

    -- Manual lint trigger
    vim.keymap.set("n", "<leader>l", function() lint.try_lint() end, { desc = "Trigger linting" })
  end,
}

