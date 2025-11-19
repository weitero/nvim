local icons = require("config").icons.diagnostics
local lazy_ns = require("lazy.core.config").ns
local prev_severity

vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    prefix = function(diagnostic, i, total)
      if diagnostic.namespace == lazy_ns then return "󰊢 " end

      local curr_severity = diagnostic.severity
      local lnum = diagnostic.lnum
      local prefix = ""

      -- Need the part after `or` to handle situations where diagnostics are on the last line
      local cnt = vim.diagnostic.count(0, { lnum = lnum, severity = curr_severity })[curr_severity]
        or vim.diagnostic.count(0, { lnum = lnum + 1, severity = curr_severity })[curr_severity]
        or 0

      if i == 1 or prev_severity ~= curr_severity then
        prev_severity = curr_severity
        prefix = icons[curr_severity] .. cnt .. " "
      elseif i == total then
        prev_severity = nil
      end
      return prefix
    end,
    format = function(diagnostic) return diagnostic.namespace == lazy_ns and diagnostic.message or "" end,
  },
  virtual_lines = {
    current_line = true,
    format = function(diagnostic) return icons[diagnostic.severity] .. diagnostic.message end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons[vim.diagnostic.severity.ERROR],
      [vim.diagnostic.severity.WARN] = icons[vim.diagnostic.severity.WARN],
      [vim.diagnostic.severity.HINT] = icons[vim.diagnostic.severity.HINT],
      [vim.diagnostic.severity.INFO] = icons[vim.diagnostic.severity.INFO],
    },
  },
  float = true,
  update_in_insert = true,
  severity_sort = true,
})
