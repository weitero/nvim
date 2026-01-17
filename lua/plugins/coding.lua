return {
  {
    "nvim-mini/mini.pairs",
    version = false,
    opts = {
      -- In which modes mappings from this `config` should be created
      modes = { command = true },
    },
  },

  {
    "nvim-mini/mini.surround",
    version = false,
    opts = {
      -- Whether to respect selection type:
      -- - Place surroundings on separate lines in linewise mode.
      -- - Place surroundings on each line in blockwise mode.
      respect_selection_type = true,
    },
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },

  {
    "danymat/neogen",
    config = true,
    keys = {
      { "<Leader>nf", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true } },
      { "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", { noremap = true, silent = true } },
    },
  },

  { import = "plugins.extended.coding" },
}
