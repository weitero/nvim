return {
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   opts = {},
  -- },

  {
    "echasnovski/mini.hipatterns",
    version = false,
    config = function(_, opts)
      local hipatterns = require("mini.hipatterns")
      opts.highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      }
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
      -- Your setup opts here
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      ---@type false | "classic" | "modern" | "helix"
      preset = "helix",
      icons = {
        breadcrumb = "󰄾", -- symbol used in the command line area that shows your active key combo
        separator = "󱦰", -- symbol used between a key and it's label
        group = "󰐕", -- symbol prepended to a group
        ellipsis = "󰇘",
        -- used by key format
        keys = {
          Up = "󰁝",
          Down = "󰁅",
          Left = "󰁍",
          Right = "󰁔",
          C = "󰘴",
          M = "󰘵",
          D = "󰘳",
          S = "󰘶",
          CR = "󰌑",
          Esc = "󱊷",
          ScrollWheelDown = "󱕐",
          ScrollWheelUp = "󱕑",
          NL = "󰌑",
          BS = "󰌍",
          Space = "󱁐",
          Tab = "󰌒",
          F1 = "󱊫",
          F2 = "󱊬",
          F3 = "󱊭",
          F4 = "󱊮",
          F5 = "󱊯",
          F6 = "󱊰",
          F7 = "󱊱",
          F8 = "󱊲",
          F9 = "󱊳",
          F10 = "󱊴",
          F11 = "󱊵",
          F12 = "󱊶",
        },
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
    ---@type Flash.Config
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
        mode = { "n" },
        function()
          require("dial.map").manipulate("increment", "normal")
        end,
        desc = "",
      },
      {
        "<C-x>",
        mode = { "n" },
        function()
          require("dial.map").manipulate("decrement", "normal")
        end,
        desc = "",
      },
      {
        "g<C-a>",
        mode = { "n" },
        function()
          require("dial.map").manipulate("increment", "gnormal")
        end,
        desc = "",
      },
      {
        "g<C-x>",
        mode = { "n" },
        function()
          require("dial.map").manipulate("decrement", "gnormal")
        end,
        desc = "",
      },
      {
        "<C-a>",
        mode = { "v" },
        function()
          require("dial.map").manipulate("increment", "visual")
        end,
        desc = "",
      },
      {
        "<C-x>",
        mode = { "v" },
        function()
          require("dial.map").manipulate("decrement", "visual")
        end,
        desc = "",
      },
      {
        "g<C-a>",
        mode = { "v" },
        function()
          require("dial.map").manipulate("increment", "gvisual")
        end,
        desc = "",
      },
      {
        "g<C-x>",
        mode = { "v" },
        function()
          require("dial.map").manipulate("decrement", "gvisual")
        end,
        desc = "",
      },
    },
    opts = {
      group = { default = { semver = { "semver" } } },
      filetype = {
        lua = {
          constant = {
            "bool",
            {
              elements = { "and", "or" },
              word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
              cyclic = true, -- "or" is incremented into "and".
            },
          },
        },
      },
    },
    config = function(_, opts)
      local group = opts.group or {}
      local filetype = opts.filetype or {}

      local function _format_augend(augend_category, augend_config)
        -- TODO: assert type of `augend_category`
        if type(augend_config) == "table" then
          return require("dial.augend." .. augend_category).new(augend_config)
        end
        return require("dial.augend." .. augend_category).alias[augend_config]
      end
      local function _parse_augends(group_or_filetype)
        for item, augends in pairs(group_or_filetype) do
          local formatted_augends = {}
          for augend_category, augend_configs in pairs(augends) do
            for _, augend_config in ipairs(augend_configs) do
              table.insert(formatted_augends, _format_augend(augend_category, augend_config))
            end
          end
          if item == "default" then
            vim.list_extend(require("dial.config").augends.group.default, formatted_augends)
          elseif item ~= vim.bo.filetype then
            require("dial.config").augends:register_group({ [item] = formatted_augends })
          else
            vim.list_extend(formatted_augends, require("dial.config").augends.group.default)
            require("dial.config").augends:on_filetype({ [item] = formatted_augends })
          end
        end
      end

      if group then
        _parse_augends(group)
      end
      if filetype then
        _parse_augends(filetype)
      end
    end,
  },
}
