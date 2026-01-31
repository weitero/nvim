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
              cargo = {
                features = {
                  "all",
                },
              },
              check = {
                command = "clippy",
                extraArgs = {
                  "--no-deps",
                },
                workspace = false,
              },
              completion = {
                fullFunctionSignatures = {
                  enable = true,
                },
              },
              diagnostics = {
                disabled = {
                  "inactive-code",
                },
                styleLints = {
                  enable = true,
                },
              },
              inlayHints = {
                bindingModeHints = true,
              },
            },
          },
        },
      },
    },
  },
}
