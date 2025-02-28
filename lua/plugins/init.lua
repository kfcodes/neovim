-- ~/.config/nvim/lua/plugins/init.lua

local modules = {
    "plugin_manager",
    "lsp_and_completion",
    "syntax_and_highlighting",
    "ui_and_navigation",
    "git_and_version_control",
    "formatting_and_linting",
    "debugging",
    "editing_enhancements",
    "terminal_and_tools",
}

for _, module in ipairs(modules) do
    local ok, err = pcall(require, "plugins." .. module)
    if not ok then
        vim.api.nvim_err_writeln("Error loading plugins/" .. module .. ": " .. err)
    end
end
