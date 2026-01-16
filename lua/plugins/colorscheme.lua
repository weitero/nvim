local catppuccin_colors = require("catppuccin.utils.colors")

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
      float = { transparent = true },
      auto_integrations = true,
      highlight_overrides = {
        all = function(colors)
          return {
            -- Match upstream CursorColumn, but tweak for better contrast
            -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/editor.lua
            CursorColumn = {
              bg = catppuccin_colors.vary_color(
                { latte = catppuccin_colors.lighten(colors.mantle, 0.70, colors.base) },
                catppuccin_colors.darken(colors.surface0, 0.64, colors.base)
              ),
            },
          }
        end,
      },
    },
  },

  { "f-person/auto-dark-mode.nvim", opts = {} },
}
