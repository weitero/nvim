return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        backdrop = 100,
        height = 0.8,
        icons = {
          package_installed = "󰏗 ",
          package_pending = "󱧕 ",
          package_uninstalled = "󱧔 ",
        },
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
      },
      automatic_enable = {
        exclude = {
          "stylua",
        },
      },
    },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts_extend = {
      "ensure_installed",
      "automatic_enable.exclude",
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      ensure_installed = {
        "selene",
        "stylua",
      },
      auto_update = true,
      integrations = {
        ["mason-null-ls"] = false,
        ["mason-nvim-dap"] = false,
      },
    },
    opts_extend = {
      "ensure_installed",
    },
  },
}
