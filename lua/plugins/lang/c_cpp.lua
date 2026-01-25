return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "cuda",
        "objc",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "clang-format",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = {
          "clang-format",
          lsp_format = "never",
        },
        cpp = {
          "clang-format",
          lsp_format = "never",
        },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = {
            "--sort-includes",
            "--style={ \z
              AccessModifierOffset: -4, \z
              AllowShortIfStatementsOnASingleLine: Never, \z
              BasedOnStyle: LLVM, \z
              BreakBeforeBraces: Allman, \z
              ColumnLimit: 0, \z
              FixNamespaceComments: false, \z
              IndentCaseLabels: false, \z
              IndentWidth: 4, \z
              NamespaceIndentation: All, \z
              TabWidth: 4, \z
              UseTab: Never, \z
            }",
          },
        },
      },
    },
  },
}
