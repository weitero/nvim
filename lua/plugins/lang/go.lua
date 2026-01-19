return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "go",
        "gomod",
        "gosum",
        "gowork",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "gopls" } },
  },

  {
    "WhoIsSethDanial/mason-tool-installer.nvim",
    opts = { ensure_installed = { "gofumpt" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              -- Completion
              usePlaceholder = true,
              -- Inlayhint
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                ignoredError = true,
                parameterNames = true,
                rangeVariableTypes = true,
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
      formatters_by_ft = { go = { "gofumpt" } },
      formatters = { gofumpt = { prepend_args = { "-extra" } } },
    },
  },
}
