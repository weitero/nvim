return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("catppuccin-nvim")
    end,
    opts = {
      transparent_background = true, -- disables setting the background color.
      float = {
        transparent = true, -- enable transparent floating windows
      },
      auto_integrations = true,
    },
  },

  {
    "f-person/auto-dark-mode.nvim",
    opts = {},
  },
}
