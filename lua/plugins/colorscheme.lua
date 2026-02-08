return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    init = function() vim.cmd.colorscheme("catppuccin") end,
    opts = {
      transparent_background = true,
      float = {
        transparent = true,
      },
      show_end_of_buffer = true,
      auto_integrations = true,
    },
  },

  {
    "f-person/auto-dark-mode.nvim",
    opts = {},
  },
}
