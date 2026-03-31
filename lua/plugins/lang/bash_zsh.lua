return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          settings = {
            bashIde = {
              enableSourceErrorDiagnostics = true,
              shfmt = {
                binaryNextLine = true,
                caseIndent = true,
                simplifyCode = true,
              },
            },
          },
        },
      },
    },
  },
}
