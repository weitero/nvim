return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "awk",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        awk_ls = {},
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        awk = {
          "gawk",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        awk = {
          "prettier",
        },
      },
    },
  },
}
