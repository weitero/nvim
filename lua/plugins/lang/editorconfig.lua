vim.filetype.add({ filename = { ["dot_editorconfig"] = "editorconfig" } })

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "editorconfig" } },
  },
}
