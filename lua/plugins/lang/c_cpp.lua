return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c", "cpp" } },
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
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { c = { "clang-format" }, cpp = { "clang-format" } },
      formatters = {
        ["clang-format"] = { prepend_args = { "--sort-includes", "--style=file:/Users/akio/.clang-format" } },
      },
    },
  },
}
