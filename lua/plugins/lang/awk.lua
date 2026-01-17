return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "awk" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "awk_ls" } },
  },
}
