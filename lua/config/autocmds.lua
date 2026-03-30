-- Don't automatically insert the current comment leader
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    -- https://neovim.io/doc/user/change.html#fo-table
    vim.opt.formatoptions:remove({ "o", "r" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "bash",
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "jinja",
    "json",
    "json5",
    "jsonc",
    "lua",
    "r",
    "sh",
    "toml",
    "typescript",
    "typescriptreact",
    "vim",
    "yaml",
    "zsh",
  },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.tabstop = 2
  end,
})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})

-- nvim-treesitter provides queries for the following features. These are not
-- automatically enabled.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if vim.tbl_contains(require("nvim-treesitter").get_installed(), lang) then
      -- Treesitter highlighting is provided by Neovim, see :h
      -- treesitter-highlight. To enable it for a filetype, put
      -- vim.treesitter.start() in a ftplugin/<filetype>.lua in your config
      -- directory, or place the following in your init.lua:
      vim.treesitter.start()
      -- Treesitter-based folding is provided by Neovim. To enable it, put the
      -- following in your ftplugin or FileType autocommand:
      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[0][0].foldmethod = "expr"
      -- Treesitter-based indentation is provided by this plugin but considered
      -- experimental. To enable it, put the following in your ftplugin or
      -- FileType autocommand:
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
