return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "css" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "cssls" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "prettier" } },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { css = { "prettier" } },
      formatters = { prettier = { prepend_args = { "--single-quote", "--trailing-comma", "es5" } } },
    },
  },
}
