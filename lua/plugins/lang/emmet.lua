return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "css",
        "html",
        "htmldjango",
        "pug",
        "scss",
        "svelte",
        "templ",
        "tsx",
        "vue",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "emmet_language_server",
      },
    },
  },
}
