-- Plugin: SimpylFold
-- Indent-based folding for Python: collapse functions, classes, etc.

return {
	"tmhedberg/SimpylFold",
	ft = "python",
	config = function()
		-- Plugin globals
		-- optional: preview docstrings when hovering folded blocks
		vim.g.simpylfold_docstring_preview = 1
		vim.g.simpylfold_fold_docstring = 1
		vim.g.simpylfold_docstring_preview = 1
		vim.g.simpylfold_fold_imports = 1
		vim.g.simpylfold_fold_comments = 0
		vim.g.simpylfold_open_fold_hl = "CursorLineNr"

		-- Buffer-local fold settings
		vim.opt_local.foldmethod = "expr"
		vim.opt_local.foldexpr = "SimpylFold()"
		vim.opt_local.foldlevel = 1
	end,
}
