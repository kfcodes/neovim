-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config/keymaps")
require("config/lazy-bootstrap")
require("config/lazy-plugins")
require("config/options")
