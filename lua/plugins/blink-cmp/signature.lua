return {
  {
    "saghen/blink.cmp",
    opts = {
      -- Experimental signature help support
      signature = {
        enabled = not pcall(function()
          require("noice")
        end),
        window = {
          scrollbar = true, -- Note that the gutter will be disabled when border ~= 'none'
        },
      },
    },
  },
}
