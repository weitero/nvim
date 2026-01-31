local diagnostics_icons = require("config").icons.diagnostics
local git_icons = require("config").icons.git
local kind_icons = require("config").icons.kinds

local function get_element_icon(opts)
  local mini_icons = require("mini.icons")
  if opts.directory then
    return mini_icons.get("directory", opts.path)
  end
  return mini_icons.get("file", opts.path)
end

return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-mini/mini.icons",
    opts = {
      options = {
        buffer_close_icon = "",
        modified_icon = " ",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        diagnostics = "nvim_lsp",
        get_element_icon = get_element_icon,
        separator_style = "padded_slope",
      },
    },
  },

  {
    "nvim-mini/mini.icons",
    version = false,
    opts = {},
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function(_, opts)
      local highlight = require("config").rainbow
      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        for rainbow, hl in pairs(require("config").rainbow_hl) do
          vim.api.nvim_set_hl(0, rainbow, hl)
        end
      end)
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      opts.indent = { highlight = highlight }
      opts.scope = { highlight = highlight }
      opts.exclude = { filetypes = { "dashboard", "help", "lazy", "mason" } }
      return opts
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    main = "rainbow-delimiters.setup",
    opts = { highlight = require("config").rainbow },
  },

  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },

      cmdline = {
        format = {
          cmdline = { icon = " " },
          search_down = { icon = " " },
          search_up = { icon = " " },
          filter = { icon = " " },
          lua = { icon = " " },
          help = { icon = " " },
          input = { icon = " " }, -- Used by input()
        },
      },
      popupmenu = {
        kind_icons = kind_icons, -- set to `false` to disable icons
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = { stages = "slide", render = "wrapped-compact" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- nvim-treesitter (optional, but highly recommended) used for highlighting the cmdline and lsp docs. Make sure to install the parsers for
      ensure_installed = {
        "bash",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "vim",
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    opts = {
      sections = {
        lualine_b = {
          { "branch", icon = " " },
          {
            "diff",
            symbols = { added = git_icons.added, modified = git_icons.modified, removed = git_icons.removed },
          },
          {
            "diagnostics",

            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            sources = { "nvim_diagnostic" },
            symbols = {
              error = diagnostics_icons[vim.diagnostic.severity.ERROR],
              warn = diagnostics_icons[vim.diagnostic.severity.WARN],
              info = diagnostics_icons[vim.diagnostic.severity.INFO],
              hint = diagnostics_icons[vim.diagnostic.severity.HINT],
            },
            update_in_insert = true, -- Update diagnostics in insert mode.
          },
        },
        lualine_x = {
          {
            require("noice").api.status.message.get_hl,
            cond = require("noice").api.status.message.has,
          },
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = "#ff9e64" },
          },
        },
      },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local header = [[
░░      ░░░  ░░░░  ░░        ░░░      ░░
▒  ▒▒▒▒  ▒▒  ▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒  ▒
▓  ▓▓▓▓  ▓▓     ▓▓▓▓▓▓▓▓  ▓▓▓▓▓  ▓▓▓▓  ▓
█        ██  ███  ██████  █████  ████  █
█  ████  ██  ████  ██        ███      ██
]]
      header = string.rep("\n", 8) .. header .. "\n\n"
      local opts = {
        theme = "doom",
        config = {
          header = vim.split(header, "\n"),
          center = {
            { icon = " ", desc = "New File", key = "n", action = ":enew | startinsert" },
            { icon = " ", desc = "Lazy", key = "l", action = ":Lazy" },
            { icon = " ", desc = "Mason", key = "m", action = ":Mason" },
            { icon = " ", desc = "Conform", key = "c", action = ":ConformInfo" },
            { icon = " ", desc = "Quit", key = "q", action = ":qa" },
          },
        },
      }
      return opts
    end,
    dependencies = "nvim-mini/mini.icons",
  },
}
