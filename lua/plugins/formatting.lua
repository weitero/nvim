vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

vim.filetype.add({
  filename = {
    ["compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose",
  },
})

-- {{{ conform.nvim
require("conform").setup({
  formatters_by_ft = {
    awk = { "prettier" },
    html = { "oxfmt" },
    javascript = { "oxfmt" },
    javascriptreact = { "oxfmt" },
    jinja = { "djlint" },
    json = { "fixjson", "jq", lsp_format = "last" },
    json5 = { "fixjson", lsp_format = "last" },
    jsonc = { "fixjson", lsp_format = "last" },
    lua = { "stylua" },
    markdown = { "markdownlint", "prettier" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    sql = { "sql_formatter" },
    toml = { "taplo", "tombi" },
    typescript = { "oxfmt" },
    typescriptreact = { "oxfmt" },
    yaml = { "yamlfix", "yamlfmt" },
    ["yaml.docker-compose"] = { "yamlfix", "yamlfmt", lsp_format = "last" },
  },
  default_format_opts = { async = true, lsp_format = "fallback" },
  formatters = { jq = { args = { "-S", "." } } },
})

vim.keymap.set("", "<leader>f", function()
  require("conform").format({}, function(err)
    if not err then
      local mode = vim.api.nvim_get_mode().mode
      if vim.startswith(string.lower(mode), "v") then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      end
    end
  end)
end, { desc = "Format code" })

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ range = range })
end, { range = true })
-- }}}
