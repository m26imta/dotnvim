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

-- set showbreak=↪\
-- vim.opt.listchars:append "eol:↴"
--[[vim.cmd [[
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
]]
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.termencoding = "utf-8"
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.backup = false  -- no annoying backup file
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true -- enable persitent undo
-- abcdefghijklmnopqrstuvwxyz
-- ABCDEFGHIJKLMNOPQRSTUVWXYZ
-- oO08 iIlL1 g9qCGQ ~-+= => <= <>(){}[]
-- vim.opt.guifont="agave Nerd Font Mono:h12"
-- if vim.fn.exists('g:neovide')==1 then print("neovide detected") end
-- vim.cmd[[set guifont=CodeNewRoman\ NFM,monospace:h14:b]]
vim.opt.iskeyword:append("-") -- "-" is also a single word. So dw can delete "a-whole-long-word"
--[[
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")  -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.formatoptions:remove({ "c", "r", "o" })  -- This is a sequence of letters which describes how automatic formatting is to be done
]]

vim.opt.timeoutlen = 500
-- vim.opt.updatetime = 300
