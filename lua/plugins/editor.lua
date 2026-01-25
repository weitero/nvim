local icons = require("config").icons

return {
  {
    "nvim-mini/mini.hipatterns",
    version = false,
    config = function(_, opts)
      local hipatterns = require("mini.hipatterns")

      opts.highlighters = {
        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      }

      -- Highlight standalone keyword annotations
      local keyword_specs = {
        { key = "fixme", group = "MiniHipatternsFixme" },
        { key = "hack", group = "MiniHipatternsHack" },
        { key = "todo", group = "MiniHipatternsTodo" },
        { key = "note", group = "MiniHipatternsNote" },
      }
      for _, spec in ipairs(keyword_specs) do
        local label = spec.key:upper()
        opts.highlighters[spec.key] = { pattern = string.format("%%f[%%w]()%s()%%f[%%W]", label), group = spec.group }
      end

      hipatterns.setup(opts)
    end,
  },

  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      symbols = {
        ---@diagnostic disable-next-line: unused-local
        icon_fetcher = function(kind, bufnr, symbol)
          return icons.kinds[kind]
        end,
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      icons = {
        breadcrumb = icons.misc.breadcrumb, -- symbol used in the command line area that shows your active key combo
        separator = icons.misc.separator, -- symbol used between a key and it's label
        group = icons.misc.group, -- symbol prepended to a group
        ellipsis = icons.misc.ellipsis,
        -- used by key format
        keys = icons.keys,
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<C-a>",
        function()
          require("dial.map").manipulate("increment", "normal")
        end,
      },
      {
        "<C-x>",
        function()
          require("dial.map").manipulate("decrement", "normal")
        end,
      },
      {
        "g<C-a>",
        function()
          require("dial.map").manipulate("increment", "gnormal")
        end,
      },
      {
        "g<C-x>",
        function()
          require("dial.map").manipulate("decrement", "gnormal")
        end,
      },
      {
        "<C-a>",
        function()
          require("dial.map").manipulate("increment", "visual")
        end,
        mode = "x",
      },
      {
        "<C-x>",
        function()
          require("dial.map").manipulate("decrement", "visual")
        end,
        mode = "x",
      },
      {
        "g<C-a>",
        function()
          require("dial.map").manipulate("increment", "gvisual")
        end,
        mode = "x",
      },
      {
        "g<C-x>",
        function()
          require("dial.map").manipulate("decrement", "gvisual")
        end,
        mode = "x",
      },
    },
    opts = function()
      local augend = require("dial.augend")
      return {
        default = { augend.semver.alias.semver },
        filetype = {
          java = {
            augend.constant.alias.bool,
            augend.constant.new({ elements = { "&&", "||" }, word = false, cyclic = true }),
          },
          lua = {
            augend.constant.alias.bool,
            augend.constant.new({ elements = { "and", "or" }, word = true, cyclic = true }),
          },
          python = {
            augend.constant.alias.Bool,
            augend.constant.new({ elements = { "and", "or" }, word = true, cyclic = true }),
          },
        },
      }
    end,
    config = function(_, opts)
      local augends = require("dial.config").augends
      local default_augends = augends.group.default or {}
      local extra_default_augends = opts.default or {}
      -- Merge custom defaults into Dial's builtin default group
      if #extra_default_augends > 0 then
        vim.list_extend(default_augends, extra_default_augends)
      end
      local merged = {}

      for filetype, filetype_augends in pairs(opts.filetype or {}) do
        -- Each filetype gets its own augends, plus the shared defaults
        local combined = vim.deepcopy(default_augends)
        vim.list_extend(combined, filetype_augends)
        merged[filetype] = combined
      end

      -- Register per-filetype augends; this replaces defaults unless we merge them
      augends:on_filetype(merged)
    end,
  },
}
