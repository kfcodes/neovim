-- Plugin: alpha-nvim
-- Dashboard / startup screen configuration.
-- Loaded on VimEnter event to show a custom dashboard.

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha     = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header ASCII art
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║██║   ██║██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Dashboard buttons
    dashboard.section.buttons.val = {
      dashboard.button("e",    "  > New File",               "<cmd>ene<CR>"),
      dashboard.button("SPC ee","  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff","󰱼 > Find File",             "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs","  > Find Word",            "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr","󰁯  > Restore Session",      "<cmd>SessionRestore<CR>"),
      dashboard.button("q",    "  > Quit NVIM",             "<cmd>qa<CR>"),
    }

    -- Apply the dashboard setup
    alpha.setup(dashboard.opts)

    -- Turn off folding in the alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
