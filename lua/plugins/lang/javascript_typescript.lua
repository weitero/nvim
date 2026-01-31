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
      automatic_enable = {
        exclude = {
          "biome",
        },
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "biome",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = {
          "biomejs",
        },
        javascriptreact = {
          "biomejs",
        },
        typescript = {
          "biomejs",
        },
        typescriptreact = {
          "biomejs",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = {
          "biome",
        },
        javascriptreact = {
          "biome",
        },
        typescript = {
          "biome",
        },
        typescriptreact = {
          "biome",
        },
      },
    },
  },
}
