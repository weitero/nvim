return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      -- Directory to install parsers and queries to (prepended to `runtimepath`
      -- to have priority)
      install_dir = vim.fn.stdpath("data") .. "/site",
    },
    opts_extend = { "ensure_installed" },
    config = function(_, opts)
      local install = opts.ensure_installed or {}
      if #install > 0 then
        require("nvim-treesitter").install(install)
      end
    end,
  },

  {
    import = "plugins.treesitter",
  },
}
