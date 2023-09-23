local tabsize = 4

-- tab & indent
vim.opt.tabstop = tabsize
vim.opt.softtabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.fillchars.eob = " "
--vim.opt.fillchars = { eob = " " }

vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.linebreak = true

vim.opt.termguicolors = true
vim.opt.clipboard = vim.opt.clipboard + { 'unnamed', 'unnamedplus' }
-- vim.opt.clipboard:preappend { "unnamedplus" }
-- vim.opt.clipboard:append { "unnamed" }
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.list = false
vim.opt.listchars = {
  tab = '→ ',
  nbsp = '␣',
  trail = '•',
  -- trail = '~',
  space = "⋅",
  extends = '▶',
  precedes = '◀',
  -- eol = '↲',
  eol = '↴',
}
