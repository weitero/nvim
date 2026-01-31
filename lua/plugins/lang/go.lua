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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            -- Build
            directoryFilters = {
              "-**/node_modules",
            },
            expandWorkspaceToModule = false,
            -- Formatting
            gofumpt = true,
            -- Completion
            usePlaceholders = true,
            -- Diagnostic
            analyses = {
              shadow = true,
              unusedparams = true,
            },
            staticcheck = true,
            vulncheck = "Imports",
            diagnosticsDelay = "250ms",
            diagnosticsTrigger = "Save",
            -- Inlayhint
            hints = {
              compositeLiteralFields = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
            },
          },
        },
      },
    },
  },
}
