local diagnostic_icons = require("config").icons.diagnostics
local lazy_namespace = require("lazy.core.config").ns

vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    prefix = (function()
      local last_severity

      return function(diagnostic, i, total)
        if diagnostic.namespace == lazy_namespace then
          return "󰊢 "
        end

        local current_severity = diagnostic.severity
        local is_first_item = i == 1
        local is_last_item = i == total

        if is_first_item then
          last_severity = nil
        end

        local severity_changed_from_last = last_severity ~= current_severity
        if is_first_item or severity_changed_from_last then
          last_severity = current_severity
          local severity_count = vim.diagnostic.count(0, { lnum = diagnostic.lnum, severity = current_severity })[current_severity]
            or 0
          return (diagnostic_icons[current_severity] or "") .. severity_count .. " "
        end

        if is_last_item then
          last_severity = nil
        end

        return ""
      end
    end)(),
    format = function(diagnostic)
      return diagnostic.namespace == lazy_namespace and diagnostic.message or ""
    end,
  },
  virtual_lines = {
    current_line = true,
    format = function(diagnostic)
      return (diagnostic_icons[diagnostic.severity] or "") .. diagnostic.message
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostic_icons[vim.diagnostic.severity.ERROR],
      [vim.diagnostic.severity.WARN] = diagnostic_icons[vim.diagnostic.severity.WARN],
      [vim.diagnostic.severity.HINT] = diagnostic_icons[vim.diagnostic.severity.HINT],
      [vim.diagnostic.severity.INFO] = diagnostic_icons[vim.diagnostic.severity.INFO],
    },
  },
  float = true,
  update_in_insert = true,
  severity_sort = true,
})
