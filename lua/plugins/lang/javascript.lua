return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "javascript" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "eslint" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "biome" } },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { javascript = { "biome" }, javascriptreact = { "biome" } },
    },
  },
}
