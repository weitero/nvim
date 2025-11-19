return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "javascript" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "eslint" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "prettier" } },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { javascript = { "prettier" }, javascriptreact = { "prettier" } },
      formatters = { prettier = { prepend_args = { "--single-quote", "--trailing-comma", "es5" } } },
    },
  },
}
