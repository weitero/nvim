vim.filetype.add({
  extension = {
    j2 = "jinja",
    jinja = "jinja",
    jinja2 = "jinja",
  },
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "jinja",
        "jinja_inline",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = { servers = { jinja_lsp = {} } },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        jinja = {
          "djlint",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        jinja = {
          "djlint",
        },
      },
    },
  },
}
