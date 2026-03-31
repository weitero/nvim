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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              schemas = require("schemastore").yaml.schemas(),
              schemaStore = {
                enable = false,
                url = "",
              },
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
        },
      },
    },
  },
}
