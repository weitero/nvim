-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local vscode_plugins = {
  "dial.nvim",
  "lazy.nvim",
  "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
}

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = nil, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
    -- default `cond` you can use to globally disable a lot of plugins
    -- when running inside vscode for example
    cond = function(plugin)
      if vim.g.vscode then
        return vim.tbl_contains(vscode_plugins, plugin.name)
      else
        return true
      end
    end, ---@type boolean|fun(self:LazyPlugin):boolean|nil
  },
  install = {
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "habamax" },
  },
  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
    backdrop = 100,
    icons = {
      cmd = "󰆍 ",
      config = "󰒓 ",
      debug = "󰨮 ",
      event = "󰉁 ",
      favorite = "󰋑 ",
      ft = "󰈔 ",
      init = "󰐊 ",
      import = "󰋺 ",
      keys = "󰌌 ",
      lazy = "󰅶 ",
      loaded = "󰗡 ",
      not_loaded = "󰄰 ",
      plugin = "󰚥 ",
      runtime = " ",
      require = "󰢱 ",
      source = "󰅴 ",
      start = "󱓞 ",
      task = "󱃔 ",
      list = {
        "󰶻 ",
        "󰄾",
        "󰨃",
        "󰅂",
        "󰍟",
      },
    },
  },
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    notify = false, -- get a notification when new updates are found
  },
  change_detection = {
    notify = false, -- get a notification when changes are found
  },
  performance = {
    rtp = {
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
