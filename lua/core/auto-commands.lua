-- lua/core/auto-commands.lua
-- Editor autocmds and lightweight filetype handling.

local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd

-- Filetype detection for files you edit often.
vim.filetype.add({
	extension = {
		conf = "conf",
		env = "dotenv",
	},

	filename = {
		[".env"] = "dotenv",
		[".env.local"] = "dotenv",
		[".env.development"] = "dotenv",
		[".env.production"] = "dotenv",
		[".env.test"] = "dotenv",
	},

	pattern = {
		[".*%.env%..*"] = "dotenv",
	},
})

-- Safely clean trailing whitespace for simple config-style files.
-- This avoids using prettier/shfmt on formats where that could be destructive.
local trim_group = augroup("TrimConfigWhitespace", {
	clear = true,
})

autocmd("BufWritePre", {
	group = trim_group,
	pattern = {
		"*.conf",
		".env",
		".env.*",
		"*.env",
	},
	callback = function()
		local view = vim.fn.winsaveview()

		vim.cmd([[%s/\s\+$//e]])

		vim.fn.winrestview(view)
	end,
})
