return {
  {
    "stevearc/conform.nvim",
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    -- Here is the recommended config for lazy-loading using lazy.nvim
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
          require("conform").format({ async = true }, function(err)
            if not err then
              local mode = vim.api.nvim_get_mode().mode
              if vim.startswith(string.lower(mode), "v") then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
              end
            end
          end)
        end,
        mode = "",
        desc = "Format code",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
      -- Set default options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Autoformat with extra features
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      format_after_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { lsp_format = "fallback" }
      end,
    },
    init = function()
      -- Define a command to run async formatting
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true })

      -- Create user commands to quickly enable/disable autoformatting
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    opts = {
      -- a list of all tools you want to ensure are installed upon
      -- start
      ensure_installed = { "stylua" },

      -- if set to true this will check each tool for updates. If updates
      -- are available the tool will be updated. This setting does not
      -- affect :MasonToolsUpdate or :MasonToolsInstall.
      -- Default: false
      auto_update = true,
    },
    opts_extend = { "ensure_installed" },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        ---@since 1.11.0
        -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
        backdrop = 100,

        icons = {
          package_installed = "󰏗 ",
          package_pending = "󱧕 ",
          package_uninstalled = "󱧔 ",
        },
      },
    },
  },
}
