return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "toml" } },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "taplo" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = { servers = { taplo = { settings = { root_markers = { "starship.toml" }, }, }, }, },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { toml = { "taplo" }, },
      formatters = {
        taplo = {
          args = function ()
            if
                require("config").find_config({ ".taplo.toml", "taplo.toml" })
            then
              return require("conform.formatters.taplo").args
            end
            return {
              "format",
              "-c", vim.fn.stdpath('data') .. "/formatter-configs/taplo.toml",
              "--stdin-filepath",
              "$FILENAME",
              "-",
            }
          end,
        },
      },
    },
  },
}
