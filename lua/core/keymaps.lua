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
