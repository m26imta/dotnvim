vim.cmd([[
if exists('g:neovide')
  echom "Install some Neovide configs"
endif
]])

if vim.fn.exists("g:neovide") then
  -- try set font
  vim.cmd([[set guifont=agave\ NFM\ r:h13]])
end