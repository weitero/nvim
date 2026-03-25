return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "tsx",
        "typescript",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss",
        "vtsls",
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "oxfmt",
        "oxlint",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = {
          "oxlint",
        },
        javascriptreact = {
          "oxlint",
        },
        typescript = {
          "oxlint",
        },
        typescriptreact = {
          "oxlint",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = {
          "oxfmt",
        },
        javascriptreact = {
          "oxfmt",
        },
        typescript = {
          "oxfmt",
        },
        typescriptreact = {
          "oxfmt",
        },
      },
    },
  },
}
