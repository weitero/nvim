return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "lua" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { lua = { "stylua" } },
    },
  },
}
