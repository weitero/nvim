return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "html" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "html" } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "htmlhint", "prettier" } },
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
    opts = { formatters_by_ft = { html = { "prettier" } } },
  },
}
