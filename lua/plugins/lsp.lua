vim.lsp.inlay_hint.enable(true, { bufnr = 0 })

return {
  { "b0o/schemastore.nvim" },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            -- https://luals.github.io/wiki/settings/
            Lua = {
              codeLens = { enable = true },
              completion = {
                callSnippet = "Both",
                keywordSnippet = "Both",
              },
              diagnostics = { neededFileStatus = { ["codestyle-check"] = "Any" } },
              format = {
                defaultConfig = {
                  indent_size = "2",
                  continuation_indent = "2",
                },
                enable = false,
              },
              hint = {
                enable = true,
                setType = true,
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
                checkThirdParty = false,
                library = {
                  "${3rd}/busted/library",
                  "${3rd}/luv/library",
                },
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
