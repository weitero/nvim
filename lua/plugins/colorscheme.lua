return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    init = function(_)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Lua
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
