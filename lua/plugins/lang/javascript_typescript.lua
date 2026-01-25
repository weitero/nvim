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
        "prettier",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = {
          "prettier",
          lsp_format = "never",
        },
        javascriptreact = {
          "prettier",
          lsp_format = "never",
        },
        typescript = {
          "prettier",
          lsp_format = "never",
        },
        typescriptreact = {
          "prettier",
          lsp_format = "never",
        },
      },
    },
  },
}
