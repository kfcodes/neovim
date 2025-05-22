-- Central place for all custom keybindings. See `:help vim.keymap.set()`.

-- shorthand
local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- ─── Leader Key ────────────────────────────────────────────────────────────────

vim.g.mapleader = " "  -- set <Space> as the leader key

-- ─── General ──────────────────────────────────────────────────────────────────

-- Exit insert mode quickly by pressing 'jk'
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Save & quit
map("n", "<leader>w", ":w<CR>",    { desc = "Save file", silent = true })
map("n", "<leader>q", ":q<CR>",    { desc = "Quit window", silent = true })
map("n", "<leader>W", ":wq<CR>",   { desc = "Save & quit", silent = true })

-- Clear search highlights with <Leader>nh
map("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights", silent = true })

-- Increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number", silent = true })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number", silent = true })

-- Text manipulation (case toggles)
map("v", "<leader>u", "gU", { desc = "Uppercase selection" })
map("v", "<leader>l", "gu", { desc = "Lowercase selection" })

-- ─── Window & Tab Navigation ───────────────────────────────────────────────────

-- Move between windows with Ctrl+{h,j,k,l}
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Split windows
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", ":close<CR>", { desc = "Close current split", silent = true })

-- Tab management
map("n", "<leader>to", ":tabnew<CR>",    { desc = "Open new tab", silent = true })
map("n", "<leader>tf", ":tabnew %<CR>",  { desc = "Open buffer in new tab", silent = true })
map("n", "<leader>tn", ":tabnext<CR>",   { desc = "Go to next tab", silent = true })
map("n", "<leader>tp", ":tabprevious<CR>", { desc = "Go to previous tab", silent = true })
map("n", "<leader>tx", ":tabclose<CR>",  { desc = "Close current tab", silent = true })

-- ─── File & Buffer Navigation ─────────────────────────────────────────────────

-- Open file explorer with <Leader>pv
map("n", "<leader>pv", ":Ex<CR>", { desc = "Open file explorer", silent = true })

-- Buffer delete
map("n", "<leader>bd", ":bd<CR>", { desc = "Delete current buffer", silent = true })

-- ─── Terminal ─────────────────────────────────────────────────────────────────

-- Exit terminal mode with Esc Esc
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode", silent = true })

-- ─── Diagnostics ───────────────────────────────────────────────────────────────

map("n", "[d", vim.diagnostic.goto_prev,    { desc = "Go to previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next,    { desc = "Go to next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics in float" })
map("n", "<leader>qf", vim.diagnostic.setloclist, { desc = "Send diagnostics to loclist" })

-- ─── LSP Actions ───────────────────────────────────────────────────────────────

map("n", "gd", vim.lsp.buf.definition,      { desc = "Go to definition" })
map("n", "gr", vim.lsp.buf.references,      { desc = "List references" })
map("n", "gi", vim.lsp.buf.implementation,  { desc = "Go to implementation" })
map("n", "K",  vim.lsp.buf.hover,           { desc = "Hover documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename,  { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- ─── Surround & Substitute Operators ───────────────────────────────────────────

map("n", "ys", "<Plug>Ysurround",           { desc = "Add surrounding" })
map("n", "ds", "<Plug>Dsurround",           { desc = "Delete surrounding" })
map("n", "cs", "<Plug>Csurround",           { desc = "Change surrounding" })

-- vim: ts=2 sts=2 sw=2 et
