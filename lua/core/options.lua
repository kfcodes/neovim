-- Central place for Neovim options. See `:help vim.opt`.

-- shorthand
local o   = vim.opt      -- global/vim options
local wo  = vim.wo       -- window-scoped options
local bo  = vim.bo       -- buffer-scoped options
local g   = vim.g        -- global vim variables

-- ─── Basics ────────────────────────────────────────────────────────────────────

o.number          = true     -- show absolute line number
o.relativenumber  = true     -- show relative numbers for easy motions
o.cursorline      = true     -- highlight the current line
o.signcolumn      = 'yes'    -- always show signcolumn so text doesn't shift
o.termguicolors   = true     -- true color support
o.background      = 'dark'   -- tell colorschemes to use dark variants

o.showmode        = false    -- don't show -- INSERT -- etc. (statusline covers it)
o.breakindent     = true     -- maintain indent on wrapped lines

-- ─── Indentation & Tabs ───────────────────────────────────────────────────────

o.expandtab       = true     -- use spaces instead of tabs
o.tabstop         = 2        -- number of spaces per Tab
o.shiftwidth      = 2        -- number of spaces to use for autoindent
o.smartindent     = true     -- smart auto-indent new lines
o.autoindent      = true     -- copy indent from current line

-- ─── Wrapping ─────────────────────────────────────────────────────────────────

o.wrap            = false    -- disable line wrap by default
o.linebreak       = true     -- wrap at word boundaries when wrap is on

-- ─── Search ───────────────────────────────────────────────────────────────────

o.ignorecase      = true     -- case-insensitive search…
o.smartcase       = true     -- …unless expression contains uppercase
o.incsearch       = true     -- show search matches as you type
o.hlsearch        = false    -- disable highlight of all matches by default

-- ─── Splits & Windows ─────────────────────────────────────────────────────────

o.splitright      = true     -- vertical splits go to the right
o.splitbelow      = true     -- horizontal splits go below
o.scrolloff       = 10       -- keep 10 lines visible above/below cursor
o.sidescrolloff   = 8        -- keep 8 columns visible left/right of cursor

-- ─── Mouse & Clipboard ────────────────────────────────────────────────────────

o.mouse           = 'a'      -- enable mouse in all modes
o.clipboard       = 'unnamedplus'  -- use system clipboard by default

-- ─── File Handling & Undo ─────────────────────────────────────────────────────

o.undofile        = true     -- persist undo history
o.backup          = false    -- no backup files
o.swapfile        = false    -- no swapfile
o.backspace       = 'indent,eol,start'  -- backspace over autoindent, eol, start
o.updatetime      = 250      -- faster CursorHold & swap writes
o.timeoutlen      = 300      -- time to wait for a mapped sequence

-- ─── UI Tweaks ────────────────────────────────────────────────────────────────

o.list            = true     -- show whitespace characters
o.listchars       = { tab = '» ', trail = '·', nbsp = '␣' }
o.inccommand      = 'split'  -- live preview of substitute in split
o.cmdheight       = 1        -- space for command-line messages
o.ruler           = false    -- disable ruler (shown in statusline)

-- ─── Performance ───────────────────────────────────────────────────────────────

o.lazyredraw      = true     -- don't redraw while executing macros
o.synmaxcol       = 200      -- stop syntax highlighting after this column

-- ─── Messaging ─────────────────────────────────────────────────────────────────

o.shortmess:append("c")       -- don't show “match 1 of 2” messages

-- ─── Window Title & Status ─────────────────────────────────────────────────────

o.title           = true     -- set terminal title to current file
o.titlestring     = "%f – NVIM"

-- ─── Fill Characters ───────────────────────────────────────────────────────────

o.fillchars       = {
  vert = "┃",    -- vertical split line
  eob  = " ",    -- hide ~ on empty lines
  fold = "·",    -- filler for closed folds
}

-- ─── Cursor Shapes ──────────────────────────────────────────────────────────────

o.guicursor       = {
  n = "n-v-c:block",   -- normal, visual, command modes: block
  i = "i-ci-ve:ver25", -- insert : vertical bar, 25% width
  r = "r-cr:hor20",    -- replace : horizontal bar, 20% height
}

-- ─── Netrw (optional) ─────────────────────────────────────────────────────────

g.netrw_liststyle = 3        -- tree-style file browser

-- vim: ts=2 sts=2 sw=2 et
