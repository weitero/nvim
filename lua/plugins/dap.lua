return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
      },
      {
        "<leader>b",
        function()
          require("dap").toggle_breakpoint()
        end,
      },
      {
        "<leader>B",
        function()
          require("dap").set_breakpoint()
        end,
      },
      {
        "<leader>lp",
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end,
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
      },
    },
    init = function(_)
      local icons = require("config").icons.dap
      vim.fn.sign_define("DapBreakpoint", { text = icons.Breakpoint, texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = icons.BreakpointCondition, texthl = "", linehl = "", numhl = "" }
      )
      vim.fn.sign_define("DapLogPoint", { text = icons.LogPoint, texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapStopped",
        { text = icons.Stopped[1], texthl = icons.Stopped[2], linehl = icons.Stopped[3], numhl = "" }
      )
      vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = icons.BreakpointRejected[1], texthl = icons.BreakpointRejected[2], linehl = "", numhl = "" }
      )
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    init = function(_)
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    opts = {
      icons = { expanded = "", collapsed = "", current_frame = "" },
      controls = {
        icons = {
          pause = "",
          play = "",
          step_into = "",
          step_over = "",
          step_out = "",
          step_back = "",
          run_last = "",
          terminate = "",
          disconnect = "",
        },
      },
    },
  },

  { "theHamsta/nvim-dap-virtual-text", opts = {} },

  { "LiadOz/nvim-dap-repl-highlights", opts = {} },

  { "WhoIsSethDaniel/mason-tool-installer.nvim" },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "LiadOz/nvim-dap-repl-highlights" },
    opts = { ensure_installed = { "dap_repl" } },
  },
}
