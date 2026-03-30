local git_icons = require("config").icons.git
local kind_icons = require("config").icons.kinds

return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false

      local map = vim.api.nvim_set_keymap
      local options = { noremap = true, silent = true }
      -- Move to previous/next
      map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", options)
      map("n", "<A-.>", "<Cmd>BufferNext<CR>", options)

      -- Re-order to previous/next
      map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", options)
      map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", options)

      -- Goto buffer in position...
      map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", options)
      map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", options)
      map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", options)
      map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", options)
      map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", options)
      map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", options)
      map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", options)
      map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", options)
      map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", options)
      map("n", "<A-0>", "<Cmd>BufferLast<CR>", options)

      -- Pin/unpin buffer
      map("n", "<A-p>", "<Cmd>BufferPin<CR>", options)
      -- Close buffer
      map("n", "<A-c>", "<Cmd>BufferClose<CR>", options)

      -- Sort automatically by...
      map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", options)
      map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", options)
      map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", options)
      map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", options)
      map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", options)
    end,
    opts = {
      icons = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
        buffer_index = true,
        button = " ",
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = false },
          [vim.diagnostic.severity.WARN] = { enabled = false },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = false },
        },
        gitsigns = {
          added = { enabled = false },
          changed = { enabled = false },
          deleted = { enabled = false },
        },
        modified = { button = git_icons.modified },
        pinned = { button = " ", filename = true },
      },
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
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
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  {
    import = "plugins.ui",
  },
}
