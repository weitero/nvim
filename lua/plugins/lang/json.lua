vim.filetype.add({
  filename = {
    [".djlintrc"] = "json",
    [".stylelintrc"] = "json",
    ["dot_djlintrc"] = "json",
    djlintrc = "json",
  },
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "json",
        "json5",
        "jsonc",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "jsonls",
      },
      automatic_enable = {
        exclude = {
          "biome",
        },
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "fixjson",
        "prettier",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {
          settings = {
            json = {
              validate = { enable = true },
              schemas = require("schemastore").json.schemas(),
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        json = {
          "fixjson",
        },
        json5 = {
          "prettier",
        },
        jsonc = {
          "fixjson",
        },
      },
    },
  },
}
