vim.pack.add({ "https://codeberg.org/mfussenegger/nvim-lint" })

-- {{{ nvim-lint
require("lint").linters_by_ft = {
  awk = { "gawk" },
  dockerfile = { "hadolint" },
  html = { "htmlhint" },
  javascript = { "oxlint" },
  javascriptreact = { "oxlint" },
  jinja = { "djlint" },
  markdown = { "markdownlint", "vale" },
  sql = { "sqlfluff" },
  typescript = { "oxlint" },
  typescriptreact = { "oxlint" },
  yaml = { "yamllint" },
}
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChanged" }, {
  callback = function() require("lint").try_lint() end,
})
-- }}}
