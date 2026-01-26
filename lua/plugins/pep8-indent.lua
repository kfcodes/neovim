-- Plugin: vim-python-pep8-indent
-- A Python-aware indent engine that follows PEP-8 more closely.

return {
	"Vimjas/vim-python-pep8-indent",
	ft = "python", -- only enable in Python buffers
	init = function()
		-- if you want to customize its behavior:
		vim.g.python_pep8_indent_multiline = 1
	end,
}
