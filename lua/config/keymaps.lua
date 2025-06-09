local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- diagnostics
local diagnostic_goto = function(count, severity)
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    vim.diagnostic.jump({ count = count, severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "[e", diagnostic_goto(-1, "ERROR"), { desc = "Prev Error" })
map("n", "]e", diagnostic_goto(1, "ERROR"), { desc = "Next Error" })
map("n", "[w", diagnostic_goto(-1, "WARN"), { desc = "Prev Warning" })
map("n", "]w", diagnostic_goto(1, "WARN"), { desc = "Next Warning" })
