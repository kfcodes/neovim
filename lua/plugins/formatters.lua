require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,      -- Python Formatter
        require("null-ls").builtins.formatting.prettier,   -- JSON, JS, React Formatter
        require("null-ls").builtins.formatting.stylua,     -- Lua Formatter
        require("null-ls").builtins.formatting.dockerfile_lint, -- Docker Linter
        require("null-ls").builtins.diagnostics.ansiblelint, -- Ansible Linter
    }
})

