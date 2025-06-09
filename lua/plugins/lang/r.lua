return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "markdown", "markdown_inline", "r", "rnoweb", "yaml", "latex", "csv" } },
  },

  {
    "saghen/blink.cmp",
    dependencies = { "R-nvim/cmp-r" },
    opts = {
      sources = { default = { "cmp_r" }, providers = { cmp_r = { name = "cmp_r", module = "blink.compat.source" } } },
    },
  },

  { "R-nvim/cmp-r", ft = { "r" }, dependencies = { "R-nvim/R.nvim" } },
  { "R-nvim/R.nvim", ft = { "r" }, opts = {} },

  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "air" } } },

  { "mason-org/mason-lspconfig.nvim", opts = { automatic_enable = { exclude = { "air" } } } },

  { "stevearc/conform.nvim", opts = { formatters_by_ft = { r = { "air" } } } },
}
