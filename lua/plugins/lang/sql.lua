return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "sql",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "sqls",
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "sql-formatter",
        "sqlfluff",
      },
    },
  },

  -- Configuration using lazy.nvim with vim-dadbod-ui
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  { -- optional saghen/blink.cmp completion source
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          sql = { inherit_defaults = true, "dadbod" },
        },
        -- add vim-dadbod-completion to your completion providers
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sql = {
          "sqlfluff",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = {
          "sql_formatter",
        },
      },
    },
  },
}
