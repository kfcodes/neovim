-- Dashboard / startup screen via alpha-nvim

local alpha     = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header ASCII art
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  -- …etc…
}

-- Shortcut buttons
dashboard.section.buttons.val = {
  dashboard.button("e",  "  > New File",                "<cmd>ene<CR>"),
  dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
  dashboard.button("SPC ff", "󰱼 > Find File",              "<cmd>Telescope find_files<CR>"),
  dashboard.button("SPC fs", "  > Find Word",             "<cmd>Telescope live_grep<CR>"),
  dashboard.button("SPC wr", "󰁯  > Restore Session",      "<cmd>SessionRestore<CR>"),
  dashboard.button("q",  " > Quit NVIM",                 "<cmd>qa<CR>"),
}

-- apply and disable folding
alpha.setup(dashboard.opts)
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
