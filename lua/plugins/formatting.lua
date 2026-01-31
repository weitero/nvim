local leave_visual_mode = function(err)
  if not err then
    if vim.startswith(string.lower(vim.api.nvim_get_mode().mode), "v") then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
    end
  end
end

return {
  {
    "stevearc/conform.nvim",

    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,

    -- This will provide type hinting with LuaLS
    --- @module "conform"
    --- @type conform.setupOpts
    opts = {
      -- Map of filetype to formatters
      formatters_by_ft = { lua = { "stylua", lsp_format = "fallback" } },
      default_format_opts = { lsp_format = "fallback" },
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
      format_after_save = { lsp_format = "fallback" },
      formatters = { stylua = { prepend_args = { "--verify" } } },
    },

    -- Here is the recommended config for lazy-loading using lazy.nvim
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
          -- Leave visual mode after range format
          require("conform").format({ async = true }, leave_visual_mode)
        end,
        mode = { "n", "v" },
        desc = "Format code",
      },
    },
  },

  {
    "weitero/informal.nvim",
    opts = {},
  },
}
