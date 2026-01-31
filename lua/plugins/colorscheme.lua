return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
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
