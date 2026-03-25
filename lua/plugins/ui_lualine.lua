local diagnostics_icons = require("config").icons.diagnostics
local git_icons = require("config").icons.git

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
    opts = {
      sections = {
        lualine_b = {
          { "branch", icon = " " },
          {
            "diff",
            symbols = { added = git_icons.added, modified = git_icons.modified, removed = git_icons.removed },
          },
          {
            "diagnostics",

            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            sources = { "nvim_diagnostic" },
            symbols = {
              error = diagnostics_icons[vim.diagnostic.severity.ERROR],
              warn = diagnostics_icons[vim.diagnostic.severity.WARN],
              info = diagnostics_icons[vim.diagnostic.severity.INFO],
              hint = diagnostics_icons[vim.diagnostic.severity.HINT],
            },
            update_in_insert = true, -- Update diagnostics in insert mode.
          },
        },
        lualine_x = {
          {
            require("noice").api.status.message.get_hl,
            cond = require("noice").api.status.message.has,
          },
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = "#ff9e64" },
          },
        },
      },
    },
  },
}
