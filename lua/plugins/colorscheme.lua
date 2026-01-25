return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      float = {
        transparent = true,
      },
      auto_integrations = true,
    },
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "f-person/auto-dark-mode.nvim",
    opts = {},
  },
}
