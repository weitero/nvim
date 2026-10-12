vim.pack.add({ "https://github.com/nvim-mini/mini.diff" })
vim.pack.add({ "https://github.com/nvim-mini/mini.icons" })
vim.pack.add({ "https://github.com/saghen/blink.indent" })
vim.pack.add({ "https://gitlab.com/HiPhish/rainbow-delimiters.nvim" })

-- {{{ mini.diff
require("mini.diff").setup({
  view = {
    signs = { add = "▎", change = "▎", delete = "▎" },
  },
})
-- }}}

-- {{{ mini.icons
require("mini.icons").setup({
  lsp = {
    array = { glyph = "" },
    boolean = { glyph = "" },
    class = { glyph = "" },
    color = { glyph = "" },
    constant = { glyph = "" },
    constructor = { glyph = "" },
    enum = { glyph = "" },
    enummember = { glyph = "" },
    event = { glyph = "" },
    field = { glyph = "" },
    file = { glyph = "" },
    folder = { glyph = "" },
    ["function"] = { glyph = "" },
    interface = { glyph = "" },
    key = { glyph = "" },
    keyword = { glyph = "" },
    method = { glyph = "" },
    module = { glyph = "" },
    namespace = { glyph = "" },
    null = { glyph = "" },
    number = { glyph = "" },
    object = { glyph = "" },
    operator = { glyph = "" },
    package = { glyph = "" },
    property = { glyph = "" },
    reference = { glyph = "" },
    snippet = { glyph = "" },
    string = { glyph = "" },
    struct = { glyph = "" },
    text = { glyph = "" },
    typeparameter = { glyph = "" },
    unit = { glyph = "" },
    value = { glyph = "" },
    variable = { glyph = "" },
  },
})
-- }}}

-- {{{ blink.indent
-- }}}

-- {{{ rainbow-delimiters.nvim
-- }}}
