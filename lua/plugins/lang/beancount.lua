vim.filetype.add({
  extension = {
    bean = "beancount",
    beancount = "beancount",
  },
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "beancount",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "beancount",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        beancount = {
          lsp_format = "prefer",
        },
      },
    },
  },
}
