local opt = vim.opt
opt.autowrite = true
opt.breakindent = true
opt.cindent = true
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"
opt.complete:append("kspell")
opt.complete:remove({ "t", "u" })
opt.completeopt = { "fuzzy", "menu", "menuone", "noselect", "nosort" }
opt.conceallevel = 2
opt.confirm = true
opt.copyindent = true
opt.cursorline = true
opt.expandtab = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "indent"
opt.formatexpr = "v:lua.require'conform'.formatexpr()"
opt.formatoptions:append({ n = true, t = true })
opt.ignorecase = true
opt.inccommand = "split"
opt.infercase = true
opt.jumpoptions = "view"
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.modeline = false
opt.modelines = 0
opt.mouse = "a"
opt.number = true
opt.pumborder = "rounded"
opt.relativenumber = true
opt.report = 0
opt.scrolloff = 4
opt.sessionoptions:append({ "globals", "skiprtp" })
opt.sessionoptions:remove({ "blank", "terminal" })
opt.shiftround = true
opt.shiftwidth = 4
opt.shortmess:append({ C = true, I = true, W = true, c = true })
opt.showcmd = false
opt.showmatch = true
opt.sidescrolloff = 8
opt.smartcase = true
opt.smartindent = true
opt.smoothscroll = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.visualbell = true
opt.wildmode = { "longest:full", "full" }
opt.winborder = "rounded"
opt.wrap = false
