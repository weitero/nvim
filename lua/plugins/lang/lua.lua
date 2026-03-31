return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "lua" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            -- https://luals.github.io/wiki/settings/
            Lua = {
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Both",
                keywordSnippet = "Both",
              },
              diagnostics = {
                disable = { "lowercase-global" },
                globals = { "vim" },
                neededFileStatus = {
                  ["codestyle-check"] = "Any",
                },
              },
              format = {
                defaultConfig = {
                  indent_size = "2",
                  continuation_indent = "2",
                },
              },
              hint = {
                enable = true,
              },
              runtime = {
                path = {
                  "?.lua",
                  "?/init.lua",
                  "lua/?.lua",
                  "lua/?/init.lua",
                },
                version = "LuaJIT",
              },
              telemetry = { enable = false },
              workspace = {
                checkThirdParty = "Disable",
                library = {
                  "$VIMRUNTIME",
                  "${3rd}/busted/library",
                  "${3rd}/luv/library",
                },
              },
            },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { lua = { "stylua" } },
    },
  },
}
