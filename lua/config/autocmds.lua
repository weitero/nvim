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
