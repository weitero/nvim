return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "csv",
        "latex",
        "markdown",
        "markdown_inline",
        "r",
        "rnoweb",
        "yaml",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { automatic_enable = { exclude = { "air" } } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "air" } },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { r = { "air" } } },
  },

  {
    "R-nvim/R.nvim",
    ft = { "r" },
    opts = {},
  },

  {
    "R-nvim/cmp-r",
    ft = { "r" },
    dependencies = { "R-nvim/R.nvim" },
  },

  {
    "saghen/blink.cmp",
    dependencies = { "R-nvim/cmp-r" },
    opts = {
      sources = {
        per_filetype = { r = { inherit_defaults = true, "cmp_r" } },
        providers = { cmp_r = { name = "cmp_r", module = "blink.compat.source" } },
      },
    },
  },
}
