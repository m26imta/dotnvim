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
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
--keymap("v", "<A-j>", ":m .+1<CR>==", opts)
--keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts) -- better paste

----------------------------
-- Visual Block --
-- Move text up and down
keymap("n", "J", "<Nop>", opts)
keymap("n", "K", "<Nop>", opts)
--keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
--keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
--keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
--keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- lazyvim
-- Move Lines
-- keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { noremap = true, silent = true, desc = "Move down" })
-- keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { noremap = true, silent = true, desc = "Move down" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { noremap = true, silent = true, desc = "Move down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { noremap = true, silent = true, desc = "Move down" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true, desc = "Move down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true, desc = "Move down" })

-- NvimTree
--keymap("n", "<c-space><c-e>", ":NvimTreeToggle<cr>", opts)

-- search selected text with <c-f>
keymap("v", "<c-f>", 'y<ESC>/<c-r>"<CR>', opts)

-- Vim search and replace selected text
-- https://stackoverflow.com/a/676619
vim.cmd([[vnoremap <C-r><C-e> "hy:%s/<C-r>h//gc<left><left><left>]])

-- Select entire line in VIM, without the new line character
-- https://stackoverflow.com/a/61624228
vim.cmd([[
vnoremap al :<C-U>normal 0v$h<CR>
omap al :normal val<CR>
vnoremap il :<C-U>normal ^vg_<CR>
omap il :normal vil<CR>
]])

