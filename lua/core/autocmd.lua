-- https://vimhelp.org/autocmd.txt.html#autocmd-events-abc
--

vim.cmd([[
augroup options_filetype
  autocmd!
  autocmd FileType lua set shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType c set shiftwidth=8
  autocmd FileType cs set shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType python set shiftwidth=4 tabstop=4 softtabstop=4
augroup END
]])

