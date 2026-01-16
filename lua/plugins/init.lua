-- Order matters: options first, then modules that may depend on them
local config_modules = {
  "config.options",
  "config.autocmds",
  "config.diagnostics",
  "config.keymaps",
}

for _, module in ipairs(config_modules) do
  require(module)
end

return {}
