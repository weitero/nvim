return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "toml" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "tombi" } },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { toml = { "tombi" } } },
  },
}
