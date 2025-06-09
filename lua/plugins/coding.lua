return {
  {
    "echasnovski/mini.pairs",
    version = false,
    opts = {
      -- In which modes mappings from this `config` should be created
      modes = { command = true },
    },
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },

  {
    "echasnovski/mini.surround",
    version = false,
    opts = {
      -- Whether to respect selection type:
      -- - Place surroundings on separate lines in linewise mode.
      -- - Place surroundings on each line in blockwise mode.
      respect_selection_type = true,
    },
  },

  {
    "danymat/neogen",
    keys = {
      {
        "<leader>nf",
        ":lua require('neogen').generate()<CR>",
        mode = "n",
        desc = "",
        { remap = false, silent = true },
      },
      {
        "<leader>nc",
        ":lua require('neogen').generate({ type = 'class' })<CR>",
        mode = "n",
        desc = "",
        { remap = false, silent = true },
      },
    },
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },

  { import = "plugins.extended.coding" },
}
