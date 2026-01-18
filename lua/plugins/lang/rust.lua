return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "rust" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "rust_analyzer" } },
  },
}
