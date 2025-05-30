return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() vim.cmd([[colorscheme tokyonight]]) end,
  },

  {
    "zdharma-continuum/zinit-vim-syntax",
    ft = { "zsh" },
  },
}
