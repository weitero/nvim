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
    -- This will provide type hinting with LuaLS
    --- @module "conform"
    --- @diagnostic disable: undefined-doc-name
    --- @type conform.setupOpts
    opts = {
      -- Map of filetype to formatters
      default_format_opts = { lsp_format = "fallback" },
      format_on_save = nil,
      format_after_save = nil,
      formatters = {
        injected = {
          options = {
            -- Set to true to ignore errors
            ignore_errors = false,
            -- Map of treesitter language to filetype
            lang_to_ft = {
              bash = "sh",
            },
            -- Map of treesitter language to file extension
            -- A temporary file name with this extension will be generated during formatting
            -- because some formatters care about the filename.
            lang_to_ext = {
              bash = "sh",
              c_sharp = "cs",
              elixir = "exs",
              javascript = "js",
              julia = "jl",
              latex = "tex",
              markdown = "md",
              python = "py",
              ruby = "rb",
              rust = "rs",
              teal = "tl",
              typescript = "ts",
            },
            -- Map of treesitter language to formatters to use
            -- (defaults to the value from formatters_by_ft)
            lang_to_formatters = {},
          },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },

  {
    "weitero/informal.nvim",
    opts = {},
  },
}
