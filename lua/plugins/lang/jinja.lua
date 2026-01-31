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
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "jinja_lsp",
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "djlint",
      },
    },
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
