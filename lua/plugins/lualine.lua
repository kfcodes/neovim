-- Plugin: lualine.nvim
-- A blazing-fast statusline plugin.
-- Loaded on first statusline draw.

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine     = require("lualine")
    local lazy_status = require("lazy.status")
    -- Color palette
    local colors = {
      blue        = "#65D1FF",
      green       = "#3EFFDC",
      violet      = "#FF61EF",
      yellow      = "#FFDA7B",
      red         = "#FF4A4A",
      fg          = "#c3ccdc",
      bg          = "#112638",
      inactive_bg = "#2c3043",
      semilight   = "#627E97",
    }
    -- Custom theme
    local theme = {
      normal = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" }, b = { fg = colors.fg, bg = colors.bg }, c = { fg = colors.fg, bg = colors.bg } },
      insert = { a = { fg = colors.bg, bg = colors.green, gui = "bold" }, b = { fg = colors.fg, bg = colors.bg }, c = { fg = colors.fg, bg = colors.bg } },
      visual = { a = { fg = colors.bg, bg = colors.violet, gui = "bold" }, b = { fg = colors.fg, bg = colors.bg }, c = { fg = colors.fg, bg = colors.bg } },
      replace= { a = { fg = colors.bg, bg = colors.red, gui = "bold" },   b = { fg = colors.fg, bg = colors.bg }, c = { fg = colors.fg, bg = colors.bg } },
      command= { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" }, b = { fg = colors.fg, bg = colors.bg }, c = { fg = colors.fg, bg = colors.bg } },
      inactive ={ a = { fg = colors.semilight, bg = colors.inactive_bg, gui = "bold" }, b = { fg = colors.semilight, bg = colors.inactive_bg }, c = { fg = colors.semilight, bg = colors.inactive_bg } },
    }

    lualine.setup({
      options  = { theme = theme },
      sections = {
        lualine_x = {
          { lazy_status.updates, cond = lazy_status.has_updates, color = { fg = "#ff9e64" } },
          "encoding", "fileformat", "filetype",
        },
      },
    })
  end,
}
