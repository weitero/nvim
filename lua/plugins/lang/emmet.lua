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
    "neovim/lspconfig",
    opts = {
      servers = { emmet_language_server = {} },
    },
  },
}
