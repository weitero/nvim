return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "go",
        "gomod",
        "gotmpl",
        "gowork",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },

  {
    "WhoIsSethDanial/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "gofumpt",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = {
          "gofumpt",
          lsp_format = "never",
        },
      },
      formatters = {
        gofumpt = {
          prepend_args = {
            "-extra",
          },
        },
      },
    },
  },
}
