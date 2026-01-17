vim.filetype.add({
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
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
    opts = { ensure_installed = { "jinja_lsp" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "djlint" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = { servers = { jinja_lsp = { settings = { filetypes = { "jinja" } } } } },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { jinja = { "djlint" } } },
  },
}
