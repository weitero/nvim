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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        beancount = {},
      },
    },
  },
}
