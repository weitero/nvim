if not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }) then
  vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
end

return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "lua_ls" } },
    opts_extend = { "automatic_enable.exclude", "ensure_installed" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  { "mason-org/mason.nvim", opts = {} },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/schemastore.nvim" },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                  "lua/?.lua",
                  "lua/?/init.lua",
                },
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  -- Depending on the usage, you might want to add additional paths
                  -- here.
                  "${3rd}/luv/library",
                  "${3rd}/busted/library",
                },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      for server, server_opts in pairs(opts.servers) do
        if server_opts then
          vim.lsp.config(server, server_opts)
        end
      end
    end,
  },
}
