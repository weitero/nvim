return {
  {
    "saghen/blink.cmp",
    opts = {
      fuzzy = {
        -- Controls which sorts to use and in which order, falling back to the next sort if the first one returns nil
        -- You may pass a function instead of a string to customize the sorting
        --
        -- Optionally, set the table of sorts via a function instead: sorts = function() return { 'exact', 'score', 'sort_text' } end
        sorts = {
          -- (optionally) always prioritize exact matches
          "exact",

          -- pass a function for custom behavior
          -- function(item_a, item_b)
          --   return item_a.score > item_b.score
          -- end,

          "score",
          "sort_text",
        },
      },
    },
  },
}
