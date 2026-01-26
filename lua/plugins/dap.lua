-- Plugin: nvim-dap + UI + Mason integration + Python & Go adapters
-- Sets up debug adapters, a nice UI, and useful keymaps.

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- 1) A prettier UI for nvim-dap, requires nvim-nio for async I/O
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
			config = function()
				local dap = require("dap")
				local dapui = require("dapui")

				-- Configure the dap-ui layout and icons
				dapui.setup({
					icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
					controls = {
						icons = {
							pause = "⏸",
							play = "▶",
							step_into = "⏎",
							step_over = "⏭",
							step_out = "⏮",
							run_last = "▶▶",
							terminate = "⏹",
							disconnect = "⏏",
						},
					},
				})

				-- Open UI when debugging starts, close when it ends
				dap.listeners.after.event_initialized["dapui_open"] = dapui.open
				dap.listeners.before.event_terminated["dapui_close"] = dapui.close
				dap.listeners.before.event_exited["dapui_close"] = dapui.close
			end,
		},

		-- 2) Mason: manage and install debug adapters
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			config = function()
				-- Ensure delve (Go) and debugpy (Python) are installed, auto-setup them
				require("mason-nvim-dap").setup({
					ensure_installed = { "delve", "debugpy" },
					automatic_setup = true,
				})
			end,
		},

		-- 3) Python adapter: debugpy integration
		{
			"mfussenegger/nvim-dap-python",
			ft = "python",
			config = function()
				-- Setup debugpy adapter; if you use a venv, pass its python path:
				-- require("dap-python").setup("~/.virtualenvs/myenv/bin/python")
				require("dap-python").setup()
			end,
		},

		-- 4) Go adapter: Delve integration
		{
			"leoluz/nvim-dap-go",
			ft = "go",
			config = function()
				require("dap-go").setup()
			end,
		},
	},

	-- 5) Global nvim-dap keymaps
	config = function()
		local dap = require("dap")
		local km = vim.keymap.set

		-- Start / continue
		km("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
		-- Stepping
		km("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
		km("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
		km("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
		-- Breakpoints
		km("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		km("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Conditional Breakpoint" })
		-- UI toggle
		km("n", "<F7>", require("dapui").toggle, { desc = "Debug: Toggle UI" })
	end,
}
