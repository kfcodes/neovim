-- lua/ui/colors.lua
-- Central colour/theme configuration.
--
-- Theme:
-- - Catppuccin Mocha
-- - Dark pastel
-- - Works well with LSP, cmp, treesitter, telescope, gitsigns, nvim-tree, lualine, etc.

vim.opt.background = "dark"

local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
	return
end

catppuccin.setup({
	flavour = "mocha",

	background = {
		light = "latte",
		dark = "mocha",
	},

	transparent_background = false,
	show_end_of_buffer = false,
	term_colors = true,

	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},

	no_italic = false,
	no_bold = false,
	no_underline = false,

	styles = {
		comments = { "italic" },
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},

	integrations = {
		alpha = true,
		cmp = true,
		dap = true,
		dap_ui = true,
		gitsigns = true,
		indent_blankline = {
			enabled = true,
		},
		mason = true,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		neotree = false,
		noice = false,
		notify = false,
		nvimtree = true,
		telescope = {
			enabled = true,
		},
		treesitter = true,
		treesitter_context = true,
		trouble = true,
		which_key = true,
	},

	custom_highlights = function(colors)
		return {
			-- Softer floating windows.
			NormalFloat = {
				bg = colors.mantle,
			},

			FloatBorder = {
				fg = colors.blue,
				bg = colors.mantle,
			},

			-- Softer completion menu.
			Pmenu = {
				bg = colors.mantle,
				fg = colors.text,
			},

			PmenuSel = {
				bg = colors.surface1,
				fg = colors.text,
				bold = true,
			},

			-- Softer cursor line.
			CursorLine = {
				bg = colors.surface0,
			},

			-- Nicer visual selection.
			Visual = {
				bg = colors.surface2,
			},

			-- Pastel diagnostics.
			DiagnosticError = {
				fg = colors.red,
			},

			DiagnosticWarn = {
				fg = colors.yellow,
			},

			DiagnosticInfo = {
				fg = colors.sky,
			},

			DiagnosticHint = {
				fg = colors.teal,
			},
		}
	end,
})

vim.cmd.colorscheme("catppuccin-mocha")
