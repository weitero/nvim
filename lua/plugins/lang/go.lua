return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = {
      "go",
      "gomod",
      "gosum",
      "gowork",
    } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "gopls" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              usePlaceholder = true,
              analyses = { unusedparams = true },
              staticcheck = true,
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
}
