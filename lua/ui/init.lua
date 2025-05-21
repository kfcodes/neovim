-- Aggregates all UI modules.
-- pull in colorscheme, statusline, explorer, dashboard, etc.

require("ui.colors")      -- colorscheme setup (e.g. tokyonight)
require("ui.statusline")  -- lualine or other statusline config
require("ui.bufferline")  -- buffer/tabline plugin
require("ui.indentline")  -- indent guides (blankline)
require("ui.icons")       -- devicons for filetypes
require("ui.tree")        -- file explorer (nvim-tree)
require("ui.alpha")       -- dashboard (alpha-nvim)
