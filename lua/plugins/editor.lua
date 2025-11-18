local icons = require("config").icons

return {
  {
    "nvim-mini/mini.hipatterns",
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
      symbols = {
        -- You can use a custom function that returns the icon for each symbol kind.
        -- This function takes a kind (string) as parameter and should return an
        -- icon as string.
        ---@param kind string Key of the icons table below
        ---@param bufnr integer Code buffer
        ---@param symbol outline.Symbol The current symbol object
        ---@returns string|boolean The icon string to display, such as "f", or `false`
        ---                        to fallback to `icon_source`.
        icon_fetcher = function(kind, bufnr, symbol) return icons.kinds[kind] end,
      },
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
        function() require("which-key").show({ global = false }) end,
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
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "monaqa/dial.nvim",
    keys = {
      { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end },
      { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end },
      { "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end },
      { "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end },
      { "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, mode = "x" },
      { "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, mode = "x" },
      { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = "x" },
      { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = "x" },
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
        if type(augend_config) == "table" then return require("dial.augend." .. augend_category).new(augend_config) end
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

      if group then _parse_augends(group) end
      if filetype then _parse_augends(filetype) end
    end,
  },
}
