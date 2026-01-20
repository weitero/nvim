return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "python" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "basedpyright" },
      automatic_enable = { exclude = { "ruff" } },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "ruff" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                inlayHints = { callArgumentNamesMatching = true },
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
          "ruff_organize_imports",
          "ruff_format",
        },
      },
    },
  },
}
