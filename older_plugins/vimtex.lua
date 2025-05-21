vim.g.vimtex_view_method = "zathura"  -- Change to "mupdf" or "skim" if needed
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_quickfix_mode = 0

-- Ensure VimTeX is only loaded for LaTeX files
vim.cmd([[
  augroup vimtex_event
    autocmd!
    autocmd FileType tex setlocal spell
  augroup END
]])
