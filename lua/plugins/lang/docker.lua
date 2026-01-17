vim.filetype.add({
  filename = {
    ["compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
  },
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "dockerfile" } },
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
    "neovim/nvim-lspconfig",
    opts = { settings = { docker = { languageserver = { formatter = { ignoreMultilineInstructions = true } } } } },
  },
}
