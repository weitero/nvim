if not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }) then vim.lsp.inlay_hint.enable(true, { bufnr = 0 }) end

return {
  { "b0o/schemastore.nvim" },

  { "nvimtools/none-ls.nvim" },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            -- https://luals.github.io/wiki/settings/
            Lua = {
              format = { defaultConfig = { indent_size = "2" } },
              diagnostics = { neededFileStatus = { ["codestyle-check"] = "Any" } },
              codeLens = { enable = true }, -- Enable code lens.
              hint = { enable = true }, -- Whether inline hints should be enabled or not.
              hover = { previewFields = 10 }, -- When a table is hovered, its fields will be displayed in the tooltip. This setting limits how many fields can be seen in the tooltip.
              runtime = {
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                  "?.lua",
                  "?/init.lua",
                  "lua/?.lua",
                  "lua/?/init.lua",
                }, -- Defines the paths to use when using require.
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = "LuaJIT", -- The Lua runtime version to use in this environment.
              },
              type = { castNumberToInteger = true }, -- Whether casting a number to an integer is allowed.
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false, -- Whether addons can be automatically detected and the user can be prompted to enable them.
                library = {
                  -- Depending on the usage, you might want to add additional paths
                  -- here.
                  "${3rd}/luv/library",
                  "${3rd}/busted/library",
                }, -- Used to add library implementation code and definition files to the workspace scope.
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      for server, server_opts in pairs(opts.servers) do
        if server_opts then vim.lsp.config(server, server_opts) end
      end
    end,
  },
}
