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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {},
        tailwindcss = {},
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
