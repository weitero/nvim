return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ninja", "python", "rst" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "basedpyright" }, automatic_enable = { exclude = { "ruff" } } },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "debugpy", "ruff" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              analysis = { inlayHints = { genericTypes = true }, useTypingExtensions = true },
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { python = { "ruff_fix", "ruff_organize_imports", "ruff_format" } } },
  },

  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function(_, opts)
      -- If installed in a virtual environment:
      require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
      -- If using the above, then `/path/to/venv/bin/python -m debugpy --version`
      -- must work in the shell
    end,
  },
}
