-- Plugin: mini.icons
-- Icon provider used by plugins like which-key.

return {
	"echasnovski/mini.icons",
	version = false,
	config = function()
		require("mini.icons").setup()
	end,
}
