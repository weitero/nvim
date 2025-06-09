vim.filetype.add({ extension = { itermcolors = "xml" } })

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "xml" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "lemminx" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "xmlformatter" } },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { xml = { "xmlformatter" } } },
  },
}
