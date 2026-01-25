return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "rust",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "rust_analyzer",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              completion = { fullFunctionSignatures = { enable = true } },
              diagnostics = { styleLints = { enable = true } },
              hover = { actions = { references = { enable = true } } },
              inlayHints = {
                bindingModeHints = { enable = true },
                closureCaptureHints = { enable = true },
                genericParameterHints = {
                  lifetime = { enable = true },
                  type = { enable = true },
                },
                implicitDrops = { enable = true },
                implicitSizedBoundHints = { enable = true },
                parameterHints = {
                  missingArguments = { enable = true },
                  rangeExclusiveHints = { enable = true },
                },
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
        rust = {
          lsp_format = "prefer",
        },
      },
    },
  },
}
