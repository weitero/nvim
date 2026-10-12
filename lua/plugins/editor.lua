vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })
vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })
vim.pack.add({ "https://github.com/chrisgrieser/nvim-origami" })
vim.pack.add({ "https://github.com/folke/flash.nvim" })
vim.pack.add({ "https://github.com/folke/persistence.nvim" })
vim.pack.add({ "https://github.com/hat0uma/csvview.nvim" })
vim.pack.add({ "https://github.com/kylechui/nvim-surround" })
vim.pack.add({ "https://github.com/lervag/vimtex" })
vim.pack.add({ "https://github.com/nvim-mini/mini.pick" })
vim.pack.add({ "https://github.com/pappasam/nvim-repl" })
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

-- {{{ render-markdown.nvim
-- }}}

-- {{{ nvim-colorizer.lua
require("colorizer").setup()
-- }}}

-- {{{ nvim-origami
require("origami").setup()
-- }}}

-- {{{ flash.nvim
require("flash").setup()
vim.keymap.set({ "n", "x", "o" }, "s", '<cmd>lua require("flash").jump()<cr>')
vim.keymap.set({ "n", "x", "o" }, "S", '<cmd>lua require("flash").treesitter()<cr>')
vim.keymap.set({ "n", "x", "o" }, "R", '<cmd>lua require("flash").treesitter_search()<cr>')
-- }}}

-- {{{ persistence.nvim
require("persistence").setup()
vim.keymap.set("n", "<leader>pl", function() require("persistence").load() end)
vim.keymap.set("n", "<leader>pL", function() require("persistence").load({ last = true }) end)
vim.keymap.set("n", "<leader>ps", function() require("persistence").select() end)
vim.keymap.set("n", "<leader>pd", function() require("persistence").stop() end)
-- }}}

-- {{{ csvview.nvim
require("csvview").setup()
-- }}}

-- {{{ nvim-surround
-- }}}

-- {{{ vimtex
-- }}}

-- {{{ mini.pick
require("mini.pick").setup()
-- }}}

-- {{{ nvim-repl
vim.keymap.set("n", "<Leader>c", "<Plug>(ReplSendCell)", { desc = "Send Repl Cell" })
vim.keymap.set("n", "<Leader>r", "<Plug>(ReplSendLine)", { desc = "Send Repl Line" })
vim.keymap.set("x", "<Leader>r", "<Plug>(ReplSendVisual)", { desc = "Send Repl Visual Selection" })
-- }}}

-- {{{ oil.nvim
require("oil").setup({ columns = { "icon", "permissions", "size", "mtime" }, delete_to_trash = true })
-- }}}
