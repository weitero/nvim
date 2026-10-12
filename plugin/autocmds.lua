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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not vim.g.vscode and vim.tbl_contains(require("nvim-treesitter").get_installed(), lang) then
      vim.treesitter.start()
      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[0][0].foldmethod = "expr"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- Don't automatically insert the current comment leader
vim.api.nvim_create_autocmd(
  { "BufEnter", "BufWinEnter" },
  { pattern = "*", callback = function() vim.opt.formatoptions:remove({ "o", "r" }) end }
)

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", { callback = function() vim.hl.on_yank() end })
