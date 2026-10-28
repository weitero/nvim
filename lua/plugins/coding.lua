vim.pack.add({ "https://github.com/danymat/neogen" })
vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
vim.pack.add({ "https://github.com/nvim-mini/mini.completion" })
vim.pack.add({ "https://github.com/nvim-mini/mini.pairs" })
vim.pack.add({ "https://github.com/nvim-mini/mini.snippets", "https://github.com/rafamadriz/friendly-snippets" })

-- {{{ neogen
require("neogen").setup({})
-- }}}

-- {{{ lazydev.nvim
require("lazydev").setup({ library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } })
-- }}}

-- {{{ mini.completion
require("mini.completion").setup({
  lsp_completion = {
    source_func = "omnifunc",
    auto_setup = false,
    process_items = function(items, base)
      return MiniCompletion.default_process_items(
        items,
        base,
        { filtersort = "fuzzy", kind_priority = { Snippet = 99 } }
      )
    end,
  },
  fallback_action = "<C-x><C-f>",
})
MiniIcons.tweak_lsp_kind()

vim.api.nvim_create_autocmd(
  "LspAttach",
  { callback = function(args) vim.bo[args.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp" end }
)

_G.cr_action = function()
  if vim.fn.complete_info()["selected"] ~= -1 then return "\25" end
  return MiniPairs.cr()
end

vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
vim.keymap.set("i", "<CR>", "v:lua.cr_action()", { expr = true })
-- }}}

-- {{{ mini.pairs
require("mini.pairs").setup({ modes = { command = true, terminal = true } })
-- }}}

-- {{{ mini.snippets
require("mini.snippets").setup({ snippets = { require("mini.snippets").gen_loader.from_lang() } })
MiniSnippets.start_lsp_server()
-- }}}

-- {{{ friendly-snippets
-- }}}
