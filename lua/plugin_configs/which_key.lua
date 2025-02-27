local wk = require("which-key")
wk.setup({})
wk.register({
  ["<leader>f"] = { name = "Find", f = "Find Files", g = "Live Grep" }
})
