return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "clangd" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "clang-format" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          settings = {
            cmd = {
              "clangd",
              "--inlay-hints=true",
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
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = {
            "--sort-includes",
            "--style={ \z
              BasedOnStyle: LLVM, \z
              UseTab: Never, \z
              IndentWidth: 4, \z
              TabWidth: 4, \z
              BreakBeforeBraces: Allman, \z
              AllowShortIfStatementsOnASingleLine: false, \z
              IndentCaseLabels: false, \z
              ColumnLimit: 0, \z
              AccessModifierOffset: -4, \z
              NamespaceIndentation: All, \z
              FixNamespaceComments: false \z
            }",
          },
        },
      },
    },
  },
}
