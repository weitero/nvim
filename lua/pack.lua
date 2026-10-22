vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("plugins.appearance")
require("plugins.coding")
require("plugins.colorscheme")
require("plugins.editor")
require("plugins.formatting")
require("plugins.linting")
require("plugins.lsp")
require("plugins.treesitter")

local function complete(lead)
  local names = vim.tbl_map(function(p) return p.spec.name end, vim.pack.get())
  return lead == "" and names or vim.fn.matchfuzzy(names, lead)
end

vim.api.nvim_create_user_command(
  "PackUpdate",
  function(o) vim.pack.update(#o.fargs > 0 and o.fargs or nil) end,
  { nargs = "*", complete = complete }
)

vim.api.nvim_create_user_command(
  "PackDel",
  function(o) vim.pack.del(o.fargs, { force = o.bang }) end,
  { nargs = "+", bang = true, complete = complete }
)
