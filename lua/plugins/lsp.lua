vim.lsp.inlay_hint.enable(true, { bufnr = 0 })

return {
  {
    "b0o/schemastore.nvim",
  },

  {
    "neovim/nvim-lspconfig",
    opts = { servers = {} },
    config = function(_, opts)
      for server, server_opts in pairs(opts.servers) do
        vim.lsp.enable(server)
        if server_opts then
          vim.lsp.config(server, server_opts)
        end
      end
    end,
  },
}
