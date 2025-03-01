local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",       -- Python
        "yamlls",        -- YAML
        "jsonls",        -- JSON
        "ts_ls",         -- JavaScript/TypeScript
        "dockerls",      -- Docker
        "ansiblels",     -- Ansible
    }
})

local servers = { "pyright", "yamlls", "jsonls", "ts_ls", "dockerls", "ansiblels" }
for _, server in ipairs(servers) do
    lspconfig[server].setup({})
end

