-- lua/plugins/specs.lua
-- Returns a list of plugin specs by requiring each file in lua/plugins/

local plugin_files =
  vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/plugins", "*.lua", false, true)

local specs = {}

for _, path in ipairs(plugin_files) do
  local name = path:match("lua/plugins/(.+)%.lua$")
  if name and name ~= "init" and name ~= "specs" then
    local spec = require("plugins." .. name)

    -- list of specs: { {..}, {..} }
    if type(spec) == "table" and type(spec[1]) == "table" then
      vim.list_extend(specs, spec)
    else
      -- single spec: { "author/repo", ... }
      table.insert(specs, spec)
    end
  end
end

return specs
