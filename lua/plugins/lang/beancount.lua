vim.filetype.add({
  extension = {
    beancount = "beancount",
    bean = "beancount",
  },
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "beancount" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "beancount" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      init_options = {
        formatting = {
          prefix_width = 30,
          currency_column = 60,
          number_currency_spacing = 1,
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { beancount = { "bean-format" } } },
  },
}
