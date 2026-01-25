vim.filetype.add({
  filename = {
    ["compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose",
  },
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "dockerfile",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "docker_compose_language_service",
        "dockerls",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["yaml.docker-compose"] = {
          lsp_format = "prefer",
        },
        dockerfile = {
          lsp_format = "prefer",
        },
      },
    },
  },
}
