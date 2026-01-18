return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "bashls" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "beautysh" } },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { zsh = { "beautysh" } },
      formatters = {
        beautysh = {
          prepend_args = {
            "-i",
            "2",
            "-b",
          },
        },
      },
    },
  },
}
