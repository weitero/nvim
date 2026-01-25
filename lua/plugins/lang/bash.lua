return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
      },
    },
  },

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
        "shellcheck",
        "shfmt",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          settings = {
            bashIde = {
              enableSourceErrorDiagnostics = true,
              shfmt = {
                -- The following formatting flags closely resemble Google's shell style defined in https://google.github.io/styleguide/shellguide.html:
                binaryNextLine = true,
                caseIndent = true,
                simplifyCode = true,
              },
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = {
          lsp_format = "prefer",
        },
      },
    },
  },
}
