return {
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets" },

    -- use a release tag to download pre-built binaries
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "none" },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "normal",
      },

      completion = { documentation = { auto_show = true } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
    opts_extend = { "sources.default" },
  },

  -- add blink.compat
  {
    "saghen/blink.compat",
    -- use v2.* for blink.cmp v1.*
    version = "2.*",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },

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
            treesitter = { "lsp" },
          },
        },
        -- Displays a preview of the selected item on the current line
        ghost_text = { enabled = true },
      },

      -- Experimental signature help support
      signature = { enabled = not pcall(function() require("noice") end) },

      -- By default, the fuzzy matcher will give a bonus score of 4 to exact matches. If you want to ensure that exact matches are always prioritized, you may set:
      fuzzy = {
        sorts = {
          -- (optionally) always prioritize exact matches
          "exact",

          "score",
          "sort_text",
        },
      },

      sources = {
        -- Trigger characters are defined by the sources. For example, for Lua, the trigger characters are `.`, `"`, `'`.
        providers = {
          snippets = {
            should_show_items = function(ctx) return ctx.trigger.initial_kind ~= "trigger_character" end,
          },
        },
      },

      appearance = { kind_icons = require("config").icons.kinds },

      -- Mode specific
      cmdline = {
        -- use 'inherit' to inherit mappings from top level `keymap` config
        keymap = {
          -- Safely select entries with <CR>
          -- If nothing is selected (including preselections) add a newline as usual.
          -- If something has explicitly been selected by the user, select it.
          ["<CR>"] = {
            function(cmp)
              if cmp.is_visible() and cmp.get_selected_item() then
                cmp.accept()
                return true
              end
            end,
            "fallback",
          },
        },
        completion = {
          -- Displays a preview of the selected item on the current line
          ghost_text = { enabled = false },
        },
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-space>"] = { "show", "fallback" },
        ["<C-e>"] = { "cancel", "fallback" },
        -- Safely select entries with <CR>
        -- If nothing is selected (including preselections) add a newline as usual.
        -- If something has explicitly been selected by the user, select it.
        ["<CR>"] = {
          function(cmp)
            if cmp.is_visible() and cmp.get_selected_item() then
              cmp.accept()
              return true
            end
          end,
          "fallback",
        },

        -- Confirm candidate on TAB immediately when there's only one completion entry
        ["<Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              if #cmp.get_items() == 1 then
                cmp.select_and_accept()
              else
                cmp.select_next()
              end
            elseif cmp.snippet_active({ direction = 1 }) then
              cmp.snippet_forward()
            elseif require("config").has_words_before() then
              cmp.show()
              if #cmp.get_items() == 1 then cmp.select_and_accept() end
            else
              return
            end
            return true
          end,
          "fallback",
        },
        -- Super-Tab like mapping
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              cmp.select_prev()
            elseif cmp.snippet_active({ direction = -1 }) then
              cmp.snippet_backward()
            else
              return
            end
            return true
          end,
          "fallback",
        },

        ["<Up>"] = {
          function(cmp)
            if cmp.is_documentation_visible() then
              cmp.scroll_documentation_up(4)
              return true
            end
          end,
          "fallback",
        },
        ["<Down>"] = {
          function(cmp)
            if cmp.is_documentation_visible() then
              cmp.scroll_documentation_down(4)
              return true
            end
          end,
          "fallback",
        },
      },
    },
  },
}
