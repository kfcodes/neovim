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
        "ltex"          -- LaTeX (Spelling, Grammar, and Style Checking)
    }
})

local servers = { "pyright", "yamlls", "jsonls", "ts_ls", "dockerls", "ansiblels", "ltex" }
for _, server in ipairs(servers) do
    if server == "ltex" then
        lspconfig.ltex.setup({
            settings = {
                ltex = {
                    language = "en-US",  -- Change this to your preferred language
                    additionalRules = {
                        enablePickyRules = true  -- Enables more detailed grammar checks
                    },
                    checkFrequency = "save",  -- Check only when saving the file
                }
            }
        })
    else
        lspconfig[server].setup({})
    end
end
