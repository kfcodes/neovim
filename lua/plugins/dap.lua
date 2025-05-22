-- Plugin: nvim-dap + UI + Mason integration + python/go adapters
-- Full debugging workflow: adapters, UI, keymaps.

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",             -- prettier UI for dap
    "williamboman/mason.nvim",          -- manage external tools
    "jay-babu/mason-nvim-dap.nvim",     -- install debug adapters via Mason
    "leoluz/nvim-dap-go",               -- Go DAP adapter
    "mfussenegger/nvim-dap-python",     -- Python DAP adapter
  },
  config = function()
    local dap       = require("dap")
    local dapui     = require("dapui")
    local mason_dap = require("mason-nvim-dap")

    -- 1) Install & configure adapters via Mason
    mason_dap.setup({
      ensure_installed = { "delve", "debugpy" },
      automatic_setup = true,
      handlers = {}, -- you can override adapter settings here
    })

    -- 2) UI setup
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause        = "⏸",
          play         = "▶",
          step_into    = "⏎",
          step_over    = "⏭",
          step_out     = "⏮",
          run_last     = "▶▶",
          terminate    = "⏹",
          disconnect   = "⏏",
        },
      },
    })

    -- 3) Open/close hooks
    dap.listeners.after.event_initialized["dapui_open"]  = dapui.open
    dap.listeners.before.event_terminated["dapui_close"] = dapui.close
    dap.listeners.before.event_exited["dapui_close"]     = dapui.close

    -- 4) Python adapter (debugpy)
    require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

    -- 5) Keymaps for debugging
    local km = vim.keymap.set
    km("n", "<F5>",     dap.continue,       { desc = "Debug: Start/Continue" })
    km("n", "<F1>",     dap.step_into,      { desc = "Debug: Step Into" })
    km("n", "<F2>",     dap.step_over,      { desc = "Debug: Step Over" })
    km("n", "<F3>",     dap.step_out,       { desc = "Debug: Step Out" })
    km("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    km("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input "Breakpoint condition: ") end,
       { desc = "Debug: Set Conditional Breakpoint" })
    km("n", "<F7>",     dapui.toggle,       { desc = "Debug: Toggle DAP UI" })

    -- 6) Go adapter
    require("dap-go").setup()
  end,
}
