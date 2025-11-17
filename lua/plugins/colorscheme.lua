return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    init = function() vim.cmd.colorscheme("catppuccin") end,
    opts = {
      float = {
        transparent = true, -- enable transparent floating windows
      },
      -- let catppuccin automatically detect installed plugins and enable their respective integrations
      auto_integrations = true,
      highlight_overrides = {
        all = function(colors)
          local U = require("catppuccin.utils.colors")
          return {
            -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/editor.lua
            CursorColumn = {
              bg = U.vary_color(
                { latte = U.lighten(colors.mantle, 0.70, colors.base) },
                U.darken(colors.surface0, 0.64, colors.base)
              ),
            },
          }
        end,
      },
    },
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
