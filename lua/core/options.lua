-- Shorthand
local opt = vim.opt
local g = vim.g

-- Disable unused language providers
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Leader keys
g.mapleader = " "
g.maplocalleader = " "

-- Basics
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.background = "dark"
opt.showmode = false
opt.breakindent = true

-- Indentation and tabs
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true

-- Wrapping
opt.wrap = false
opt.linebreak = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- Splits and windows
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 10
opt.sidescrolloff = 8

-- Mouse and clipboard
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- File handling and undo
opt.undofile = true
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.backspace = { "indent", "eol", "start" }
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- UI tweaks
opt.list = true
opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}
opt.inccommand = "split"
opt.cmdheight = 1
opt.ruler = false
opt.laststatus = 3

-- Performance
opt.synmaxcol = 200

-- Messaging
opt.shortmess:append("c")

-- Window title and status
opt.title = true
opt.titlestring = "%f – NVIM"

-- Fill characters
opt.fillchars = {
	vert = "┃",
	eob = " ",
	fold = "·",
}

-- Cursor shapes
opt.guicursor = {
	n = "n-v-c:block",
	i = "i-ci-ve:ver25",
	r = "r-cr:hor20",
}

-- Folding
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = "0"

-- Netrw
g.netrw_liststyle = 3
g.netrw_banner = 0
g.netrw_winsize = 25

vim.opt.termguicolors = true
