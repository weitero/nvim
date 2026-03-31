return {
  {
    -- Tree-sitter is required to enable much of the functionality of R.nvim.
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "csv",
        "latex",
        "markdown",
        "markdown_inline",
        "r",
        "rnoweb",
        "yaml",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        r_language_server = {},
      },
    },
  },

  {
    "R-nvim/R.nvim",
    ft = {
      "r",
    },
    opts = {},
  },
}
