-- Plugin: nvim-surround
-- Quickly add, change, or delete surrounding characters.
-- Loaded on buffer read/new.

return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	config = true,
}
