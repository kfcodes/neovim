-- lua/core/keymaps.lua
-- Global keymaps.
--
-- Notes:
-- - <leader>e is kept free as an Explorer prefix.
-- - <leader>w is kept free as a Window/Write prefix.
-- - Diagnostics use <leader>d...
-- - Save uses <leader>ww.

local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better escape from insert mode
map("i", "jk", "<Esc>", {
	desc = "Exit insert mode",
})

-- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
	desc = "Clear search highlight",
})

-- Save / quit
map("n", "<leader>ww", "<cmd>w<CR>", {
	desc = "Save file",
})

map("n", "<leader>wq", "<cmd>wq<CR>", {
	desc = "Save and quit",
})

map("n", "<leader>qq", "<cmd>q<CR>", {
	desc = "Quit",
})

map("n", "<leader>qa", "<cmd>qa<CR>", {
	desc = "Quit all",
})

-- Window navigation
map("n", "<C-h>", "<C-w>h", {
	desc = "Move to left window",
})

map("n", "<C-j>", "<C-w>j", {
	desc = "Move to lower window",
})

map("n", "<C-k>", "<C-w>k", {
	desc = "Move to upper window",
})

map("n", "<C-l>", "<C-w>l", {
	desc = "Move to right window",
})

-- Window management
map("n", "<leader>sv", "<C-w>v", {
	desc = "Split window vertically",
})

map("n", "<leader>sh", "<C-w>s", {
	desc = "Split window horizontally",
})

map("n", "<leader>se", "<C-w>=", {
	desc = "Make splits equal size",
})

map("n", "<leader>sx", "<cmd>close<CR>", {
	desc = "Close current split",
})

-- Tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", {
	desc = "Open new tab",
})

map("n", "<leader>tx", "<cmd>tabclose<CR>", {
	desc = "Close current tab",
})

map("n", "<leader>tn", "<cmd>tabn<CR>", {
	desc = "Next tab",
})

map("n", "<leader>tp", "<cmd>tabp<CR>", {
	desc = "Previous tab",
})

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", {
	desc = "Move selection down",
})

map("v", "K", ":m '<-2<CR>gv=gv", {
	desc = "Move selection up",
})

-- Keep cursor centered when scrolling/searching
map("n", "<C-d>", "<C-d>zz", {
	desc = "Scroll down and center",
})

map("n", "<C-u>", "<C-u>zz", {
	desc = "Scroll up and center",
})

map("n", "n", "nzzzv", {
	desc = "Next search result and center",
})

map("n", "N", "Nzzzv", {
	desc = "Previous search result and center",
})

-- Better paste over selection without replacing clipboard
map("x", "<leader>p", [["_dP]], {
	desc = "Paste without replacing register",
})

-- Yank/delete to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], {
	desc = "Yank to system clipboard",
})

map("n", "<leader>Y", [["+Y]], {
	desc = "Yank line to system clipboard",
})

map({ "n", "v" }, "<leader>D", [["_d]], {
	desc = "Delete without yanking",
})

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, {
	desc = "Previous diagnostic",
})

map("n", "]d", vim.diagnostic.goto_next, {
	desc = "Next diagnostic",
})

map("n", "<leader>dd", vim.diagnostic.open_float, {
	desc = "Show diagnostic float",
})

map("n", "<leader>dl", vim.diagnostic.setloclist, {
	desc = "Send diagnostics to location list",
})
