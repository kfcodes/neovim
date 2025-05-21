-- Configure bufferline.nvim to show tabs as separators

require("bufferline").setup({
  options = {
    mode            = "tabs",    -- show buffers as tabs at top
    separator_style = "slant",   -- slanted separators
  },
})
