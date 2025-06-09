return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "bash" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "bashls" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "shellcheck", "shfmt" } },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { sh = { "shfmt" } },
      -- The following formatting flags closely resemble Google's shell style defined in https://google.github.io/styleguide/shellguide.html:
      formatters = { shfmt = { prepend_args = { "-i", "2", "-ci", "-bn" } } },
    },
  },
}
