-- Plugin: gitsigns.nvim
-- Shows Git change indicators in the sign column.
-- Loaded on buffer read/new.

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end
      -- Navigation
      map("n", "]h", gs.next_hunk,       "Next Git Hunk")
      map("n", "[h", gs.prev_hunk,       "Previous Git Hunk")
      -- Actions
      map("n", "<leader>hs", gs.stage_hunk,   "Stage Hunk")
      map("n", "<leader>hr", gs.reset_hunk,   "Reset Hunk")
      map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Visual Hunk")
      map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Visual Hunk")
      map("n", "<leader>hS", gs.stage_buffer,  "Stage Buffer")
      map("n", "<leader>hR", gs.reset_buffer,  "Reset Buffer")
      map("n", "<leader>hp", gs.preview_hunk,  "Preview Hunk")
      map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>hD", gs.diffthis,      "Diff This")
      map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff With HEAD~")
      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk")
    end,
  },
}
