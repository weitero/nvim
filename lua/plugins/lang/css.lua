return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "css" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "cssls",
        "tailwindcss",
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "prettier" } },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { css = { "prettier" } },
      formatters = {
        prettier = {
          prepend_args = {
            "--experimental-operator-position",
            "start",
            "--print-width",
            "120",
            "--single-quote",
            "--quote-props",
            "consistent",
            "--trailing-comma",
            "es5",
            "--check-ignore-pragma",
            "--prose-wrap",
            "always",
            "--vue-indent-script-and-style",
          },
        },
      },
    },
  },
}
