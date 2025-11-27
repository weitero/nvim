return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "css" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "cssls" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "biome" } },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { css = { "biome" } } },
  },
}
