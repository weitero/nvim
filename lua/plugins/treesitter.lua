return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = { "lua" },
      highlight = {
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        ---@diagnostic disable-next-line: unused-local
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then return true end
        end,
      },
      -- Incremental selection based on the named nodes from the grammar.
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grf",
          scope_incremental = "grc",
          node_decremental = "grb",
        },
      },
      -- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
      indent = { enable = true },
    },
    opts_extend = { "ensure_installed" },
    init = function()
      -- Tree-sitter based folding (implemented in Neovim itself, see :h vim.treesitter.foldexpr()). To enable it for the current window, set
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        opts = {
          refactor = {
            highlight_definitions = { enable = true, clear_on_cursor_move = true },
            highlight_current_scope = { enable = true },
            smart_rename = { enable = true, keymaps = { smart_rename = "grn" } },
            navigation = {
              enable = true,
              -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
              keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
              },
            },
          },
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "master",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        opts = {
          textobjects = {
            select = {
              enable = true,

              -- Automatically jump forward to textobj, similar to targets.vim
              lookahead = true,

              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
              },
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
              -- and should return true or false
              include_surrounding_whitespace = true,
            },
            swap = {
              enable = true,
              swap_next = { ["<leader>s"] = "@parameter.inner" },
              swap_previous = { ["<leader>S"] = "@parameter.inner" },
            },
            move = {
              enable = true,
              set_jumps = true, -- whether to set jumps in the jumplist
              goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = { query = "@class.outer", desc = "Next class start" },
                --
                -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
                ["]o"] = "@loop.*",
                -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                --
                -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
              },
              goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
              },
              goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
              },
              goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
              },
            },
            lsp_interop = {
              enable = true,
              border = "none",
              floating_preview_opts = {},
              peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dF"] = "@class.outer",
              },
            },
          },
        },
        init = function()
          local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

          -- Repeat movement with ; and ,
          -- ensure ; goes forward and , goes backward regardless of the last direction
          vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
          vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

          -- vim way: ; goes to the direction you were moving.
          -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
          -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

          -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
          vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
          vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
          vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
          vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
        end,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {},
    init = function()
      vim.keymap.set(
        "n",
        "[c",
        function() require("treesitter-context").go_to_context(vim.v.count1) end,
        { silent = true }
      )
    end,
  },
}
