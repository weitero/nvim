vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-context" })
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" })

-- {{{ nvim-treesitter
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end,
})
require("nvim-treesitter").install({
  "awk",
  "bash",
  "beancount",
  "bibtex",
  "c",
  "cpp",
  "css",
  "csv",
  "dockerfile",
  "editorconfig",
  "go",
  "gomod",
  "gotmpl",
  "gowork",
  "html",
  "java",
  "javascript",
  "jinja",
  "json",
  "json5",
  "latex",
  "lua",
  "markdown",
  "python",
  "r",
  "rnoweb",
  "rust",
  "sql",
  "toml",
  "tsx",
  "typescript",
  "xml",
  "yaml",
  "zsh",
})
-- }}}

-- {{{ nvim-treesitter-context
require("treesitter-context").setup({})
-- }}}

-- {{{ nvim-treesitter-textobjects
vim.g.no_plugin_maps = true
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    selection_modes = { ["@parameter.outer"] = "v", ["@function.outer"] = "V", ["@class.outer"] = "<c-v>" },
  },
  move = { set_jumps = true },
})

-- SELECT
local select = require("nvim-treesitter-textobjects.select")
vim.keymap.set({ "x", "o" }, "am", function() select.select_textobject("@function.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "im", function() select.select_textobject("@function.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "as", function() select.select_textobject("@local.scope", "locals") end)

-- SWAP
local swap = require("nvim-treesitter-textobjects.swap")
vim.keymap.set("n", "<leader>a", function() swap.swap_next("@parameter.inner") end)
vim.keymap.set("n", "<leader>A", function() swap.swap_previous("@parameter.outer") end)

-- MOVE
local modes = { "n", "x", "o" }
local move = require("nvim-treesitter-textobjects.move")
vim.keymap.set(modes, "]m", function() move.goto_next_start("@function.outer", "textobjects") end)
vim.keymap.set(modes, "]]", function() move.goto_next_start("@class.outer", "textobjects") end)
vim.keymap.set(modes, "]o", function() move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects") end)
vim.keymap.set(modes, "]s", function() move.goto_next_start("@local.scope", "locals") end)
vim.keymap.set(modes, "]z", function() move.goto_next_start("@fold", "folds") end)
vim.keymap.set(modes, "]M", function() move.goto_next_end("@function.outer", "textobjects") end)
vim.keymap.set(modes, "][", function() move.goto_next_end("@class.outer", "textobjects") end)
vim.keymap.set(modes, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end)
vim.keymap.set(modes, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end)
vim.keymap.set(modes, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end)
vim.keymap.set(modes, "[]", function() move.goto_previous_end("@class.outer", "textobjects") end)
-- }}}
