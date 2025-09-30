return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "javascript" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "eslint" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "prettier" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- basedpyright = {
        --   settings = {
        --     basedpyright = {
        --       disableOrganizeImports = true,
        --       analysis = { inlayHints = { genericTypes = true }, useTypingExtensions = true },
        --     },
        --   },
        -- },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { css = { "prettier" } } },
  },
}
