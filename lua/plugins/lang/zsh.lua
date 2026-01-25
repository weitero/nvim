return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "shfmt",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        zsh = {
          "shfmt",
          lsp_format = "never",
        },
      },
      formatters = {
        shfmt = {
          prepend_args = {
            "-s",
            "-bn",
            "-ci",
          },
        },
      },
    },
  },
}
