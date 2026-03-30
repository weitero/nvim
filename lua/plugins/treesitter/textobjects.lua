return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function()
      -- put your config here
      local map = vim.keymap.set

      -- Text objects: select
      --
      -- keymaps
      -- You can use the capture groups defined in `textobjects.scm`
      local select = require("nvim-treesitter-textobjects.select")
      map({ "x", "o" }, "am", function()
        select.select_textobject("@function.outer", "textobjects")
      end)
      map({ "x", "o" }, "im", function()
        select.select_textobject("@function.inner", "textobjects")
      end)
      map({ "x", "o" }, "ac", function()
        select.select_textobject("@class.outer", "textobjects")
      end)
      map({ "x", "o" }, "ic", function()
        select.select_textobject("@class.inner", "textobjects")
      end)
      -- You can also use captures from other query groups like `locals.scm`
      map({ "x", "o" }, "as", function()
        select.select_textobject("@local.scope", "locals")
      end)

      -- Text objects: swap
      --
      -- keymaps
      local swap = require("nvim-treesitter-textobjects.swap")
      map("n", "<leader>a", function()
        swap.swap_next("@parameter.inner")
      end)
      map("n", "<leader>A", function()
        swap.swap_previous("@parameter.outer")
      end)

      -- Text objects: move
      --
      -- keymaps
      -- You can use the capture groups defined in `textobjects.scm`
      local move = require("nvim-treesitter-textobjects.move")
      map({ "n", "x", "o" }, "]m", function()
        move.goto_next_start("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "]]", function()
        move.goto_next_start("@class.outer", "textobjects")
      end)
      -- You can also pass a list to group multiple queries.
      map({ "n", "x", "o" }, "]o", function()
        move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
      end)
      -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
      map({ "n", "x", "o" }, "]s", function()
        move.goto_next_start("@local.scope", "locals")
      end)
      map({ "n", "x", "o" }, "]z", function()
        move.goto_next_start("@fold", "folds")
      end)

      map({ "n", "x", "o" }, "]M", function()
        move.goto_next_end("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "][", function()
        move.goto_next_end("@class.outer", "textobjects")
      end)

      map({ "n", "x", "o" }, "[m", function()
        move.goto_previous_start("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[[", function()
        move.goto_previous_start("@class.outer", "textobjects")
      end)

      map({ "n", "x", "o" }, "[M", function()
        move.goto_previous_end("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[]", function()
        move.goto_previous_end("@class.outer", "textobjects")
      end)

      -- Go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      map({ "n", "x", "o" }, "]d", function()
        move.goto_next("@conditional.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[d", function()
        move.goto_previous("@conditional.outer", "textobjects")
      end)
    end,
    opts = {
      -- Text objects: select
      --
      -- Define your own text objects mappings similar to ip (inner paragraph) and ap (a paragraph).
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = false,
      },

      -- Text objects: move
      --
      -- Define your own mappings to jump to the next or previous text object.
      -- This is similar to ]m, [m, ]M, [M Neovim's mappings to jump to the next
      -- or previous function.
      move = {
        -- whether to set jumps in the jumplist
        set_jumps = true,
      },
    },
  },
}
