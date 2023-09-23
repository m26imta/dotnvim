<<<<<<< HEAD
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts) -- Remove space as no-leader
keymap("", "<c-`>", "<Nop>", opts) -- Remove grave-key ( `` )
vim.g.mapleader = " "
vim.g.maplocalleader = " "

----------------------------------
-- Insert_mode
keymap("i", "jk", "<ESC>", opts)
vim.cmd("nnoremap ; :")
keymap("o", "H", "^", opts)
keymap("o", "L", "$", opts)
vim.keymap.set({ "i", "c", "t" }, "<C-h>", "<LEFT>", { noremap = true })
vim.keymap.set({ "i", "c", "t" }, "<C-l>", "<RIGHT>", { noremap = true })
vim.keymap.set({ "i", "c", "t" }, "<C-j>", "<DOWN>", { noremap = true })
vim.keymap.set({ "i", "c", "t" }, "<C-k>", "<UP>", { noremap = true })
----------------
-- Normal_mode
-- Better window navigation
keymap("n", "<C-h>", "<C-w><LEFT>", opts)
keymap("n", "<C-j>", "<C-w><DOWN>", opts)
keymap("n", "<C-k>", "<C-w><UP>", opts)
keymap("n", "<C-l>", "<C-w><RIGHT>", opts)

-- Navigate buffers
keymap("n", "L", ":bn<CR>", opts)
keymap("n", "H", ":bp<CR>", opts)
keymap("n", "<tab>", ":bn<CR>", opts)
keymap("n", "<S-tab>", ":bp<CR>", opts)
--keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
--keymap("n", "<A-q>", "<cmd>Bwipeout<CR>", opts)
keymap("n", "<C-q><C-x>", "<cmd>q!<CR>", opts)

-- Clear highlights
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", opts)

-- fast save load config file
vim.cmd("nnoremap <c-s> :w<CR>")
vim.cmd([[
""-- Save as sudo
cnoremap w!! execute 'silent! write !SUDO_ASKPASS=`which ssh-askpass` sudo tee % >/dev/null' <bar> edit!
]])
vim.cmd("nnoremap <leader>w :w<CR>")
vim.cmd("nnoremap <leader>LL :e $MYVIMRC<CR>")

-- Do not yank with x
keymap("n", "x", '"_x', opts)
keymap({ "c", "t", "i" }, "<c-r><c-r>", '<c-r>"', { noremap = true })

-- Select all with Ctrl+a
keymap("n", "<C-a>", "ggVG", opts)

--
keymap("n", "-", "<C-x>", opts)
keymap("n", "=", "<C-a>", opts)

------------------------------------
