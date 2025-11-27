return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "html" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "html" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "biome" } },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { html = { "biome" } } },
  },
}
