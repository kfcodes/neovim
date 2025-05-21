-- Per-server custom overrides. Any server you don’t need to tweak can be omitted.

return {
  -- Example: special settings for clangd
  clangd = {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc" },
  },

  -- Example: override tsserver root detection
  tsserver = {
    root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
  },

  -- …add more…
}
