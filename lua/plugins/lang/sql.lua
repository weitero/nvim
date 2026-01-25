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
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = {
          "sql_formatter",
          lsp_format = "never",
        },
      },
      formatters = {
        sql_formatter = {
          prepend_args = {
            "-l",
            "sqlite",
          },
        },
      },
    },
  },
}
