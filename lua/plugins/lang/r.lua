return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "r",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "r_language_server",
      },
      automatic_enable = {
        exclude = {
          "air",
        },
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "air",
      },
    },
  },

  {
    "R-nvim/R.nvim",
    ft = {
      "r",
    },
    opts = {},
  },

  {
    "R-nvim/cmp-r",
    ft = {
      "r",
    },
    dependencies = {
      "R-nvim/R.nvim",
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        r = {
          "air",
          lsp_format = "never",
        },
      },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      "R-nvim/cmp-r",
    },
    opts = {
      sources = {
        per_filetype = {
          r = {
            inherit_defaults = true,
            "cmp_r",
          },
        },
        providers = {
          cmp_r = {
            name = "cmp_r",
            module = "blink.compat.source",
          },
        },
      },
    },
  },
}
