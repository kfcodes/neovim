-- lua/plugins/catppuccin.lua
-- Plugin: catppuccin.nvim
-- Pastel dark colour scheme.
--
-- The plugin spec lives here.
-- The actual colour configuration lives in lua/ui/colors.lua.

return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,

	config = function()
		require("ui.colors")
	end,
}
