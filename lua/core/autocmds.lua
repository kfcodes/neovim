local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 1) Auto-reload files changed externally
--    When you switch back to Neovim or revisit a buffer, check if the file was modified.
augroup("AutoReload", { clear = true })
autocmd({ "FocusGained", "BufEnter" }, {
	group = "AutoReload",
	command = "checktime", -- ask Vim to re-check the file timestamp
})

-- 2) Trim trailing whitespace on save
--    Cleans up any extra spaces at end-of-line, except for binary or markdown files.
augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
	group = "TrimWhitespace",
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- 3) Highlight on yank
--    Flash yanked text for 200ms using the IncSearch highlight group.
augroup("HighlightYank", { clear = true })
autocmd("TextYankPost", {
	group = "HighlightYank",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- 4) Auto-create parent directories on save
--    If the directory doesn’t exist, recursively create it before writing.
augroup("AutoCreateDir", { clear = true })
autocmd("BufWritePre", {
	group = "AutoCreateDir",
	callback = function(ctx)
		local dir = vim.fs.dirname(ctx.file)
		if not vim.loop.fs_stat(dir) then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- 5) Auto-source your init.lua after editing
--    Automatically reload your config for fast iteration.
augroup("AutoSourceInit", { clear = true })
autocmd("BufWritePost", {
	group = "AutoSourceInit",
	pattern = "init.lua",
	command = 'source <afile> | echo "⚡️ Sourced init.lua"',
})

-- 6) Toggle wrap for specific filetypes
augroup("FiletypeWrap", { clear = true })
autocmd("FileType", {
	group = "FiletypeWrap",
	pattern = { "tex", "json", "toml", "yaml", "yml" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})
autocmd("FileType", {
	group = "FiletypeWrap",
	pattern = "*",
	callback = function()
		vim.opt_local.wrap = false
	end,
})
