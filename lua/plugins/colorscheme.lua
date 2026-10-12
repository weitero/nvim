vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

-- {{{ catppuccin/nvim
require("catppuccin").setup({
  transparent_background = true,
  float = {
    transparent = true,
    solid = false,
  },
})
vim.cmd.colorscheme("catppuccin-nvim")
-- }}}
