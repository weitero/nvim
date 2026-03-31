return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                inlayHints = {
                  callArgumentNamesMatching = true,
                },
                useTypingExtensions = true,
                autoFormatStrings = true,
                exclude = {
                  "**/__pycache__",
                  "**/node_modules",
                  ".git",
                  ".venv",
                },
                extraPaths = {
                  "src",
                },
                typeCheckingMode = "standard",
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
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
      },
    },
  },
}
