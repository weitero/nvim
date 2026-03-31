vim.filetype.add({
  filename = {
    [".djlintrc"] = "json",
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
          "oxfmt",
        },
        json5 = {
          "fixjson",
          "oxfmt",
        },
        jsonc = {
          "fixjson",
          "oxfmt",
        },
      },
    },
  },
}
