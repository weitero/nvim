return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          -- optionally inherit from the `default` sources
          lua = { inherit_defaults = true, "lazydev" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",

            --- NOTE: All of these options may be functions to get dynamic behavior
            --- See the type definitions for more information
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100, -- Boost/penalize the score of the items
          },
        },
      },
    },
  },
}
