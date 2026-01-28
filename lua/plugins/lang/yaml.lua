vim.filetype.add({
  filename = {
    [".yamlfmt"] = "yaml",
    ["_clang-format"] = "yaml",
    ["~/.config/yamllint/config"] = "yaml",
    dot_yamlfmt = "yaml",
  },
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "yaml",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "yamlls",
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "yamlfix",
        "yamlfmt",
        "yamllint",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              format = { enable = false },
              schemaStore = { enable = false, url = "" },
              schemas = require("schemastore").yaml.schemas(),
              validate = false,
            },
          },
        },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        yaml = {
          "yamllint",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        yaml = {
          "yamlfix",
          "yamlfmt",
          lsp_format = "never",
        },
      },
    },
  },
}
