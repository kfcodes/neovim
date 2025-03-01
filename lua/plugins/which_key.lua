local wk = require("")
wk.setup({})
wk.register({
  ["<leader>f"] = { name = "Find", f = "Find Files", g = "Live Grep" }
})
