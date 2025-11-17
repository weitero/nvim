-- Don't automatically insert the current comment leader
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    -- https://neovim.io/doc/user/change.html#fo-table
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "json5",
    "jsonc",
    "lua",
    "sh",
    "vim",
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
  callback = function() vim.hl.on_yank() end,
})
