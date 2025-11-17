return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        ---@since 1.11.0
        -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
        backdrop = 100,

        ---@since 1.0.0
        -- Height of the window. Accepts:
        -- - Integer greater than 1 for fixed height.
        -- - Float in the range of 0-1 for a percentage of screen height.
        height = 0.8,

        icons = {
          ---@since 1.0.0
          -- The list icon to use for installed packages.
          package_installed = "󰏗 ",
          ---@since 1.0.0
          -- The list icon to use for packages that are installing, or queued for installation.
          package_pending = "󱧕 ",
          ---@since 1.0.0
          -- The list icon to use for packages that are not installed.
          package_uninstalled = "󱧔 ",
        },
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
      ---@type string[]
      ensure_installed = { "lua_ls" },

      -- Whether installed servers should automatically be enabled via `:h vim.lsp.enable()`.
      --
      -- To exclude certain servers from being automatically enabled:
      -- ```lua
      --   automatic_enable = {
      --     exclude = { "rust_analyzer", "ts_ls" }
      --   }
      -- ```
      --
      -- To only enable certain servers to be automatically enabled:
      -- ```lua
      --   automatic_enable = {
      --     "lua_ls",
      --     "vimls"
      --   }
      -- ```
      ---@type boolean | string[] | { exclude: string[] }
      automatic_enable = { exclude = { "stylua" } },
    },
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts_extend = { "automatic_enable.exclude", "ensure_installed" },
  },

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim", "nvimtools/none-ls.nvim" },
    opts = {},
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-dap" },
    opts = {},
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    opts = {
      -- a list of all tools you want to ensure are installed upon
      -- start
      ensure_installed = { "stylua" },

      -- if set to true this will check each tool for updates. If updates
      -- are available the tool will be updated. This setting does not
      -- affect :MasonToolsUpdate or :MasonToolsInstall.
      -- Default: false
      auto_update = true,
    },
    opts_extend = { "ensure_installed" },
  },
}
