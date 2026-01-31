return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "html",
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "htmlhint",
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "astro",
      "dot",
      "html",
      "javascript",
      "javascriptreact",
      "liquid",
      "markdown",
      "php",
      "rescript",
      "svelte",
      "typescript",
      "typescriptreact",
      "vue",
      "xml",
    },
    events = {
      "BufNewFile",
      "BufReadPre",
    },
    opts = {},
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        html = {
          "htmlhint",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = {
          "biome",
        },
      },
    },
  },
}
