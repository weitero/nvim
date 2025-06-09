local M = {}

local defaults = {
  -- icons used by other plugins
  icons = {
    misc = {
      dots = "󰇘 ",
    },
    ft = {
      octo = " ",
    },
    dap = {
      Stopped = { "", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint = "",
      BreakpointCondition = "",
      BreakpointRejected = { "", "DiagnosticError" },
      LogPoint = "",
    },
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    kinds = {
      Array = " ",
      Boolean = " ",
      Class = " ",
      Codeium = " ",
      Color = " ",
      Control = " ",
      Collapsed = " ",
      Constant = " ",
      Constructor = " ",
      Copilot = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = " ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = " ",
      Module = " ",
      Namespace = " ",
      Null = " ",
      Number = " ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      String = " ",
      Struct = " ",
      Supermaven = " ",
      TabNine = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = " ",
    },
  },
  rainbow = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
  },
  rainbow_hl = {
    ["RainbowRed"] = { fg = "#E06C75" },
    ["RainbowYellow"] = { fg = "#E5C07B" },
    ["RainbowBlue"] = { fg = "#61AFEF" },
    ["RainbowOrange"] = { fg = "#D19A66" },
    ["RainbowGreen"] = { fg = "#98C379" },
    ["RainbowViolet"] = { fg = "#C678DD" },
    ["RainbowCyan"] = { fg = "#56B6C2" },
  },
}

-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
function M.has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

setmetatable(M, {
  __index = function(_, key)
    return vim.deepcopy(defaults)[key]
  end,
})

return M
