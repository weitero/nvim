-- Don't automatically insert the current comment leader
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    -- how automatic formatting is to be done
    -- https://neovim.io/doc/user/change.html#fo-table
    vim.opt.formatoptions:remove({
      "c", -- Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
      "r", -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
      "o", -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode. In case comment is unwanted in a specific place use CTRL-U to quickly delete it. i_CTRL-U
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "lua", "r", "sh", "vim", "zsh" },
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
