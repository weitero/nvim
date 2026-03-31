return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        keyword = {
          -- 'prefix' will fuzzy match on the text before the cursor
          -- 'full' will fuzzy match on the text before _and_ after the cursor
          -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
          range = "full",
        },
        menu = {
          -- Controls how the completion items are rendered on the popup window
          draw = {
            -- Use treesitter to highlight the label text for the given list of sources
            -- treesitter = {},
            treesitter = { "lsp" },

            -- Components to render, grouped by column
            columns = { { "kind_icon" }, { "label" }, { "source_name" } },
          },
        },
        documentation = {
          -- Controls whether the documentation window will automatically show when selecting a completion item
          auto_show = true,
        },
        -- Displays a preview of the selected item on the current line
        ghost_text = {
          enabled = true,
        },
      },
    },
  },
}
