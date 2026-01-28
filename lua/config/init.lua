-- stylua: ignore
local M = {}

local defaults = {
  icons = {
    misc = {
      breadcrumb = "",
      ellipsis = " ",
      group = " ",
      separator = "",
    },
    ft = {
      octo = " ",
    },
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.WARN] = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    lazynvim = {
      cmd = " ",
      config = " ",
      debug = " ",
      event = " ",
      favorite = " ",
      ft = " ",
      import = " ",
      init = " ",
      keys = " ",
      lazy = " ",
      loaded = " ",
      not_loaded = " ",
      plugin = " ",
      require = " ",
      runtime = " ",
      source = " ",
      start = " ",
      task = " ",
      list = { " " },
    },
    kinds = {
      Array = " ",
      Boolean = " ",
      Class = " ",
      Codeium = " ",
      Collapsed = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Control = " ",
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
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "<CTRL>",
      M = "<OPTION>",
      D = "<CMD>",
      S = "<SHIFT>",
      CR = "<CR>",
      Esc = "<ESC>",
      NL = "<LF>",
      BS = "<BS>",
      Space = "<space>",
      Tab = "<HT>",
      F1 = "F1",
      F2 = "F2",
      F3 = "F3",
      F4 = "F4",
      F5 = "F5",
      F6 = "F6",
      F7 = "F7",
      F8 = "F8",
      F9 = "F9",
      F10 = "F10",
      F11 = "F11",
      F12 = "F12",
    },
  },
  rainbow = {
    "RainbowBlue",
    "RainbowCyan",
    "RainbowGreen",
    "RainbowOrange",
    "RainbowRed",
    "RainbowViolet",
    "RainbowYellow",
  },
  rainbow_hl = {
    ["RainbowBlue"] = { fg = "#61AFEF" },
    ["RainbowCyan"] = { fg = "#56B6C2" },
    ["RainbowGreen"] = { fg = "#98C379" },
    ["RainbowOrange"] = { fg = "#D19A66" },
    ["RainbowRed"] = { fg = "#E06C75" },
    ["RainbowViolet"] = { fg = "#C678DD" },
    ["RainbowYellow"] = { fg = "#E5C07B" },
  },
}

-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
function M.has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function M.find_config(configs)
  local git_dir = vim.fs.root(0, ".git")
  if git_dir ~= nil then
    for _, value in ipairs(configs) do
      if vim.uv.fs_stat(git_dir .. value) ~= nil then
        return true
      end
    end
    return false
  end

  for _, value in ipairs(configs) do
    if vim.fs.root(0, value) ~= nil then
      return true
    end
  end
  return false
end

setmetatable(M, {
  __index = function(_, key)
    return vim.deepcopy(defaults)[key]
  end,
})

return M
