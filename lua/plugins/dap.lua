local icons = require("config").icons

return {
  {
    "mfussenegger/nvim-dap",
    -- https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
    init = function(_)
      local sign_define = vim.fn.sign_define
      sign_define("DapBreakpoint", { text = icons.dap.Breakpoint, texthl = "", linehl = "", numhl = "" })
      sign_define(
        "DapBreakpointCondition",
        { text = icons.dap.BreakpointCondition, texthl = "", linehl = "", numhl = "" }
      )
      sign_define("DapLogPoint", { text = icons.dap.LogPoint, texthl = "", linehl = "", numhl = "" })
      sign_define("DapStopped", { text = icons.dap.Stopped, texthl = "DiagnosticWarn", linehl = "", numhl = "" })
      sign_define(
        "DapBreakpointRejected",
        { text = icons.dap.BreakpointRejected, texthl = "DiagnosticError", linehl = "", numhl = "" }
      )
    end,
    keys = {
      { "<F5>", function() require("dap").continue() end },
      { "<F10>", function() require("dap").step_over() end },
      { "<F11>", function() require("dap").step_into() end },
      { "<F12>", function() require("dap").step_out() end },
      { "<Leader>b", function() require("dap").toggle_breakpoint() end },
      { "<Leader>B", function() require("dap").set_breakpoint() end },
      {
        "<Leader>lp",
        function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
      },
      { "<Leader>dr", function() require("dap").repl.open() end },
      { "<Leader>dl", function() require("dap").run_last() end },
      { "<Leader>dh", function() require("dap.ui.widgets").hover() end, mode = { "n", "v" } },
      { "<Leader>dp", function() require("dap.ui.widgets").preview() end, mode = { "n", "v" } },
      {
        "<Leader>ds",
        function()
          local widgets = require("dap.ui.widgets")
          widgets.centered_float(widgets.scopes)
        end,
      },
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    init = function(_)
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end,
    opts = {
      controls = {
        icons = icons.dapui.controls,
      },
      icons = {
        expanded = icons.dapui.expanded,
        collapsed = icons.dapui.collapsed,
        current_frame = icons.dapui.current_frame,
      },
    },
  },

  { "theHamsta/nvim-dap-virtual-text", opts = {} },

  { "LiadOz/nvim-dap-repl-highlights", opts = {} },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "LiadOz/nvim-dap-repl-highlights" },
    opts = { ensure_installed = { "dap_repl" } },
  },
}
