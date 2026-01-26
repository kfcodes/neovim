local lualine = require("lualine")
local lazy_status = require("lazy.status") -- show pending updates

local colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	red = "#FF4A4A",
	fg = "#c3ccdc",
	bg = "#112638",
	inactive_bg = "#2c3043",
	semilightgray = "#627E97",
}

local my_theme = {
	normal = {
		a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg, bg = colors.bg },
	},
	insert = {
		a = { fg = colors.bg, bg = colors.green, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg, bg = colors.bg },
	},
	visual = {
		a = { fg = colors.bg, bg = colors.violet, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg, bg = colors.bg },
	},
	replace = {
		a = { fg = colors.bg, bg = colors.red, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg, bg = colors.bg },
	},
	command = {
		a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg, bg = colors.bg },
	},
	inactive = {
		a = { fg = colors.semilightgray, bg = colors.inactive_bg, gui = "bold" },
		b = { fg = colors.semilightgray, bg = colors.inactive_bg },
		c = { fg = colors.semilightgray, bg = colors.inactive_bg },
	},
}

lualine.setup({
	options = { theme = my_theme },
	sections = {
		lualine_x = {
			{ lazy_status.updates, cond = lazy_status.has_updates, color = { fg = "#ff9e64" } },
			"encoding",
			"fileformat",
			"filetype",
		},
	},
})
