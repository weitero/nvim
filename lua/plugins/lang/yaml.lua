vim.filetype.add({ filename = { ["_clang-format"] = "yaml" } })

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "yaml" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "yamlls" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              format = {
                proseWrap = "always",
                printWidth = 120,
              },
              schemas = { ["https://www.schemastore.org/clang-format-21.x.json"] = "_clang-format" },
              keyOrdering = true,
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { yaml = { lsp_format = "fallback" } },
    },
  },
}
