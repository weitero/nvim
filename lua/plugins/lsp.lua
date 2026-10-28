vim.pack.add({
  "https://github.com/b0o/SchemaStore.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

-- {{{ SchemaStore.nvim
-- }}}

-- {{{ nvim-lspconfig
vim.lsp.inlay_hint.enable(true)

vim.lsp.enable({
  "awk_ls",
  "basedpyright",
  "bashls",
  "beancount",
  "clangd",
  "docker_compose_language_service",
  "dockerls",
  "emmet_language_server",
  "gopls",
  "html",
  "jdtls",
  "jinja_lsp",
  "jsonls",
  "lemminx",
  "lua_ls",
  "marksman",
  "mise",
  "r_language_server",
  "rust_analyzer",
  "sqls",
  "tailwindcss",
  "texlab",
  "tombi",
  "vtsls",
  "yamlls",
})

vim.lsp.config("*", { capabilities = MiniCompletion.get_lsp_capabilities() })

local schemas = require("schemastore")
vim.lsp.config("jsonls", { settings = { json = { validate = { enable = true }, schemas = schemas.json.schemas() } } })
vim.lsp.config("lemminx", { cmd = { "lemminx-osx-aarch_64" } })
vim.lsp.config("mise", { init_options = { formatting = false, hover = false, completion = false } })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.java",
  callback = function() vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true }) end,
})
-- }}}
