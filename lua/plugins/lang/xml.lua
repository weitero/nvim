vim.filetype.add({
  extension = {
    itermcolors = "xml",
  },
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "xml",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { lemminx = { cmd = { "lemminx-osx-aarch_64" } } },
    },
  },
}
