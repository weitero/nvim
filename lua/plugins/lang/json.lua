return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "json", "json5", "jsonc" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "jsonls" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "fixjson", "biome" } },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { json = { "fixjson", "biome" }, jsonc = { "fixjson", "biome" } } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {
          settings = { json = { schemas = require("schemastore").json.schemas(), validate = { enable = true } } },
        },
      },
    },
  },
}
