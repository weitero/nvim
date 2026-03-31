return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "css",
        "scss",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = { cmd = { "css-language-server" } },
        tailwindcss = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        css = {
          "oxfmt",
        },
      },
    },
  },
}
