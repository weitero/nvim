vim.filetype.add({
  filename = {
    [".djlintrc"] = "json",
    ["dot_djlintrc"] = "json",
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
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "fixjson",
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
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
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
          lsp_format = "last",
        },
        json5 = {
          "fixjson",
          lsp_format = "never",
        },
        jsonc = {
          "fixjson",
          lsp_format = "last",
        },
      },
    },
  },
}
