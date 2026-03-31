return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "markdown",
        "markdown_inline",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        markdown = {},
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {
          "markdownlint",
          "vale",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = {
          "markdownlint",
          "prettier",
        },
      },
    },
  },
}
