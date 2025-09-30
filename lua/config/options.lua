local opt = vim.opt
opt.autowrite = true -- automatically write file if changed
opt.breakat:remove("-") -- characters that may cause a line break
opt.breakindent = true -- wrapped line repeats indent
opt.cindent = true -- do C program indenting
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- use the clipboard as the unnamed register
opt.colorcolumn = "81" -- columns to highlight
opt.completeopt:append({ "menuone", "noselect" }) -- options for Insert mode completion
opt.completeopt:remove("popup") -- options for Insert mode completion
opt.conceallevel = 2 -- whether concealable text is shown or hidden
opt.confirm = true -- ask what to do about unsaved/read-only files
opt.copyindent = true -- make 'autoindent' use existing indent structure
opt.cursorcolumn = true -- highlight the screen column of the cursor
opt.cursorline = true -- highlight the screen line of the cursor
opt.expandtab = true -- use spaces when <Tab> is inserted
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- expression used when 'foldmethod' is "expr"
opt.foldlevel = 99 -- close folds with a level higher than this
opt.foldmethod = "expr" -- folding type
opt.formatexpr = "v:lua.require'conform'.formatexpr()" -- expression used with "gq" command
opt.formatoptions:append({ n = true, t = true }) -- how automatic formatting is to be done
opt.guicursor = "" -- GUI: settings for cursor shape and blinking
opt.ignorecase = true -- ignore case in search patterns
opt.infercase = true -- adjust case of match for keyword completion
opt.jumpoptions = "view" -- specifies how jumping is done
opt.laststatus = 3 -- tells when last window has status lines
opt.linebreak = true -- wrap long lines at a blank
opt.list = true -- show <Tab> and <EOL>
opt.listchars:append({ eol = "", multispace = "󱁐 ", leadmultispace = " " }) -- characters for displaying in list mode
opt.modeline = false -- recognize modelines at start or end of file
opt.modelines = 0 -- number of lines checked for modelines
opt.mouse = "a" -- enable the use of mouse clicks
opt.number = true -- print the line number in front of each line
opt.pumblend = 10 -- Enables pseudo-transparency for the popup-menu.
opt.pumheight = 10 -- maximum number of items to show in the popup menu
opt.relativenumber = true -- show relative line number in front of each line
opt.report = 0 -- threshold for reporting nr. of lines changed
opt.ruler = false -- show cursor line and column in the status line
opt.scrolloff = 7 -- minimum nr. of lines above and below cursor
opt.sessionoptions:append({ "globals", "skiprtp" }) -- options for :mksession
opt.shiftround = true -- round indent to multiple of shiftwidth
opt.shiftwidth = 4 -- number of spaces to use for (auto)indent step
opt.shortmess:append({ W = true, I = true, c = true }) -- list of flags, reduce length of messages
opt.showbreak = "" -- string to use at the start of wrapped lines
opt.showmatch = true -- briefly jump to matching bracket if insert one
opt.showmode = false -- message on status line to show current mode
opt.sidescrolloff = 7 -- min. nr. of columns to left and right of cursor
opt.smartcase = true -- no ignore case when pattern has uppercase
opt.smartindent = true -- smart autoindenting for C programs
opt.smoothscroll = true -- scroll by screen lines when 'wrap' is set
opt.softtabstop = 4 -- number of spaces that <Tab> uses while editing
opt.spell = true -- enable spell checking
opt.spelllang:append({ "de" }) -- language(s) to do spell checking for
opt.splitbelow = true -- new window from split is below the current one
opt.splitkeep = "screen" -- determines scroll behavior for split windows
opt.splitright = true -- new window is put right of the current one
opt.swapfile = false -- whether to use a swapfile for a buffer
opt.syntax = "ON" -- syntax to be loaded for current buffer
opt.tabstop = 4 -- number of spaces that <Tab> in file uses
opt.timeoutlen = 300 -- time out time in milliseconds
opt.undofile = true -- save undo information in a file
opt.undolevels = 10000 -- maximum number of changes that can be undone
opt.updatetime = 200 -- after this many milliseconds flush swap file
opt.virtualedit = "block" -- when to use virtual editing
opt.visualbell = true -- use visual bell instead of beeping
opt.wildmode = { "longest:full", "full" } -- mode for 'wildchar' command-line expansion
opt.winborder = "rounded" -- Defines the default border style of floating windows.
opt.winminwidth = 5 -- minimal number of columns for any window
opt.wrap = true -- long lines wrap and continue on the next line
