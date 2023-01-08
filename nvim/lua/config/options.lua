vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.termguicolors = true -- True color support
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.listchars = {
  eol = "↲",
  nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
  extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
  precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
  tab = "  ", -- '▷─' WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
  trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
  space = " ",
}
vim.opt.fillchars = {
  fold = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  eob = " ",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
  diff = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
  msgsep = "‾",
  foldopen = "▾",
  foldclose = "▸",
  foldsep = "│",
}

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.undofile = true -- use a file to save undo
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo" -- Set the undofile location
vim.opt.swapfile = false
vim.opt.undolevels = 10000

vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.wrap = false -- Disable wrap
vim.opt.showmatch = true

vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers

vim.opt.incsearch = true -- incremental search
vim.opt.hlsearch = true -- highlight search results
vim.opt.ignorecase = true -- Ignore case
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

vim.opt.scrolloff = 4 -- Lines of context
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.backspace = "indent,start,eol" -- make backspace behave like normal
vim.opt.mouse = "nv" -- ignore mouse
vim.opt.updatetime = 200 -- CursorHold interval

vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.softtabstop = 2 -- Number of spaces tabs count for
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.opt.shiftround = true -- Round indent

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current.
vim.opt.laststatus = 3 -- always show status line
vim.opt.cmdheight = 1
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.showtabline = 2
vim.opt.title = true
vim.opt.conceallevel = 2 -- enable concealing
vim.opt.signcolumn = "yes:1" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.shortmess = "filnxtToOFWIcC"

vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.background = "dark"
vim.opt.inccommand = "split"
vim.opt.splitkeep = "screen"
vim.opt.completeopt = {
  "menu",
  "menuone",
  "preview",
  "noselect",
  "noinsert",
}
vim.opt.wildmode = "longest:full,full" -- Command-lin completion mod
vim.opt.wildmenu = true
vim.opt.spell = false
vim.opt.autowrite = true -- enable autowrite
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.wrapscan = false
vim.opt.encoding = "UTF-8"
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 5
vim.opt.colorcolumn = "+1"
vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 1
vim.opt.formatoptions:append("j")

vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python")
vim.g.loaded_python_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
